﻿using IndieVisible.Domain.Core.Extensions;
using IndieVisible.Domain.Interfaces.Repository;
using IndieVisible.Domain.Interfaces.Service;
using IndieVisible.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace IndieVisible.Domain.Services
{
    public class PollDomainService : BaseDomainMongoService<Poll, IPollRepository>, IPollDomainService
    {
        public PollDomainService(IPollRepository repository) : base(repository)
        {
        }

        public void RemoveByContentId(Guid userContentId)
        {
            repository.RemoveByContentId(userContentId);
        }

        public Poll GetByUserContentId(Guid userContentId)
        {
            Poll obj = repository.Get(x => x.UserContentId == userContentId).FirstOrDefault();

            return obj;
        }

        public Poll GetPollByOptionId(Guid id)
        {
            Poll obj = repository.GetPollByOptionId(id);

            obj.Options = obj.Options.Safe();
            obj.Votes = obj.Votes.Safe();

            return obj;
        }

        public void AddVote(Guid userId, Guid pollId, Guid optionId)
        {
            PollVote newVote = new PollVote
            {
                UserId = userId,
                PollId = pollId,
                PollOptionId = optionId
            };

            Task<bool> task = repository.AddVote(pollId, newVote);

            task.Wait();
        }

        public void ReplaceVote(Guid userId, Guid pollId, Guid oldOptionId, Guid newOptionId)
        {
            PollVote vote = repository.GetVote(userId, pollId);

            if (vote != null)
            {
                vote.PollOptionId = newOptionId;
            }

            Task<bool> task = repository.UpdateVote(vote);

            task.Wait();
        }

        public bool CheckUserVoted(Guid userId, Guid pollOptionId)
        {
            int count = repository.CountVotes(x => x.UserId == userId && x.PollOptionId == pollOptionId);

            return count > 0;
        }

        public IEnumerable<PollVote> GetVotes(Guid pollId)
        {
            IQueryable<PollVote> objs = repository.GetVotes(pollId);

            return objs.ToList();
        }
    }
}