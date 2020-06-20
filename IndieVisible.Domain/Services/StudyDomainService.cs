﻿using IndieVisible.Domain.Core.Enums;
using IndieVisible.Domain.Interfaces.Repository;
using IndieVisible.Domain.Interfaces.Services;
using IndieVisible.Domain.Models;
using IndieVisible.Domain.ValueObjects;
using IndieVisible.Domain.ValueObjects.Study;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace IndieVisible.Domain.Services
{
    public class StudyDomainService : IStudyDomainService
    {
        protected readonly IProfileDomainService profileDomainService;
        protected readonly IStudyCourseRepository studyCourseRepository;
        protected readonly IStudyGroupRepository studyGroupRepository;

        public StudyDomainService(IProfileDomainService profileDomainService, IStudyCourseRepository studyCourseRepository, IStudyGroupRepository studyGroupRepository)
        {
            this.profileDomainService = profileDomainService;
            this.studyCourseRepository = studyCourseRepository;
            this.studyGroupRepository = studyGroupRepository;
        }

        #region General


        public IEnumerable<Guid> GetMentorsByUserId(Guid currentUserId)
        {
            IEnumerable<UserConnection> mentorsIAdded = profileDomainService.GetConnectionByUserId(currentUserId, UserConnectionType.Mentor);
            IEnumerable<UserConnection> mentorsAddedMe = profileDomainService.GetConnectionByTargetUserId(currentUserId, UserConnectionType.Pupil);

            List<Guid> finalList = new List<Guid>();

            foreach (UserConnection connection in mentorsIAdded)
            {
                finalList.Add(connection.TargetUserId);
            }

            foreach (UserConnection mentor in mentorsAddedMe)
            {
                if (!finalList.Any(x => x == mentor.UserId))
                {
                    finalList.Add(mentor.UserId);
                }
            }

            return finalList;
        }

        public IEnumerable<Guid> GetStudentsByUserId(Guid currentUserId)
        {
            IEnumerable<UserConnection> studentsIAdded = profileDomainService.GetConnectionByUserId(currentUserId, UserConnectionType.Pupil);
            IEnumerable<UserConnection> studentsAddedMe = profileDomainService.GetConnectionByTargetUserId(currentUserId, UserConnectionType.Mentor);

            List<Guid> finalList = new List<Guid>();

            foreach (UserConnection connection in studentsIAdded)
            {
                finalList.Add(connection.TargetUserId);
            }

            foreach (UserConnection student in studentsAddedMe)
            {
                if (!finalList.Any(x => x == student.UserId))
                {
                    finalList.Add(student.UserId);
                }
            }

            return finalList;
        }
        #endregion

        #region Course
        public List<StudyCourseListItemVo> GetCoursesByUserId(Guid userId)
        {
            List<StudyCourseListItemVo> objs = studyCourseRepository.GetCoursesByUserId(userId);

            return objs;
        }

        public StudyCoursesOfUserVo GetCoursesForUserId(Guid userId)
        {
            List<UserCourseVo> objs = studyCourseRepository.Get().Where(x => x.Members.Any(y => y.UserId == userId)).Select(x => new UserCourseVo
            {
                CourseId = x.Id,
                CourseName = x.Name
            }).ToList();

            StudyCoursesOfUserVo result = new StudyCoursesOfUserVo
            {
                UserId = userId
            };

            if (objs.Any())
            {
                result.Courses = objs;
            }

            return result;
        }
        public StudyCourse GenerateNewCourse(Guid userId)
        {
            StudyCourse model = new StudyCourse
            {
                UserId = userId
            };

            return model;
        }

        public StudyCourse GetCourseById(Guid id)
        {
            Task<StudyCourse> task = Task.Run(async () => await studyCourseRepository.GetById(id));

            return task.Result;
        }

        public void AddCourse(StudyCourse model)
        {
            studyCourseRepository.Add(model);
        }

        public void UpdateCourse(StudyCourse model)
        {
            studyCourseRepository.Update(model);
        }

        public void RemoveCourse(Guid id)
        {
            studyCourseRepository.Remove(id);
        }

        public IEnumerable<StudyPlan> GetPlans(Guid courseId)
        {
            List<StudyPlan> entries = studyCourseRepository.GetPlans(courseId).ToList();

            return entries;
        }

        public async Task<bool> SavePlans(Guid courseId, List<StudyPlan> plans)
        {
            List<StudyPlan> existingTerms = studyCourseRepository.GetPlans(courseId).ToList();

            foreach (StudyPlan plan in plans)
            {
                StudyPlan existing = existingTerms.FirstOrDefault(x => x.Id == plan.Id);
                if (existing == null)
                {
                    await studyCourseRepository.AddPlan(courseId, plan);
                }
                else
                {
                    existing.Name = plan.Name;
                    existing.Description = plan.Description;
                    existing.ScoreToPass = plan.ScoreToPass;
                    existing.Order = plan.Order;

                    await studyCourseRepository.UpdatePlan(courseId, existing);
                }
            }

            IEnumerable<StudyPlan> deleteTerms = existingTerms.Where(x => !plans.Contains(x));

            //checked students with those plans and update them;
            if (deleteTerms.Any())
            {
                foreach (StudyPlan plan in deleteTerms)
                {
                    await studyCourseRepository.RemovePlan(courseId, plan.Id);
                }
            }

            return true;
        }
        #endregion
    }
}
