﻿using IndieVisible.Application.ViewModels.Study;
using IndieVisible.Domain.ValueObjects;
using System;
using System.Collections.Generic;

namespace IndieVisible.Application.Interfaces
{
    public interface IStudyAppService
    {
        OperationResultVo GetMyMentors(Guid currentUserId);

        OperationResultVo GetMyStudents(Guid currentUserId);

        OperationResultVo GetCourses(Guid currentUserId);

        OperationResultVo GetCoursesByMe(Guid currentUserId);

        OperationResultVo GetMyCourses(Guid currentUserId);

        OperationResultVo GenerateNewCourse(Guid currentUserId);

        OperationResultVo<Guid> SaveCourse(Guid currentUserId, CourseViewModel vm);

        OperationResultVo RemoveCourse(Guid currentUserId, Guid id);

        OperationResultVo GetCourseById(Guid currentUserId, Guid id);

        OperationResultVo GetPlans(Guid currentUserId, Guid courseId);

        OperationResultVo SavePlans(Guid currentUserId, Guid courseId, IEnumerable<StudyPlanViewModel> plans);

        OperationResultVo EnrollCourse(Guid currentUserId, Guid courseId);

        OperationResultVo LeaveCourse(Guid currentUserId, Guid courseId);
    }
}