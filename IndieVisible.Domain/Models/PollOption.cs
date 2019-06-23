﻿using IndieVisible.Domain.Core.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace IndieVisible.Domain.Models
{
    public class PollOption : Entity
    {
        public Guid PollId { get; set; }

        public int Index { get; set; }

        public string Text { get; set; }

        public string Image { get; set; }

        public virtual Poll Poll { get; set; }

    }
}
