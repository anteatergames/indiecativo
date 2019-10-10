﻿using IndieVisible.Domain.Core.Enums;
using IndieVisible.Domain.Core.Models;
using System;
using System.Collections.Generic;

namespace IndieVisible.Domain.Models
{
    public class BrainstormIdea : Entity
    {
        public string Title { get; set; }

        public string Description { get; set; }

        public Guid SessionId { get; set; }

        public BrainstormIdeaStatus Status { get; set; }

        public virtual BrainstormSession Session { get; set; }

        public virtual ICollection<BrainstormComment> Comments { get; set; }

        public virtual ICollection<BrainstormVote> Votes { get; set; }
    }
}
