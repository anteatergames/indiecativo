﻿using IndieVisible.Domain.Core.Models;
using System;

namespace IndieVisible.Domain.Models
{
    public class GameFollow : Entity
    {
        public Guid GameId { get; set; }
    }
}
