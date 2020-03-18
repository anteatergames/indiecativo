﻿using IndieVisible.Domain.Core.Enums;
using IndieVisible.Domain.Core.Models;
using IndieVisible.Domain.ValueObjects;
using System.Collections.Generic;

namespace IndieVisible.Domain.Models
{
    public class UserProfile : Entity
    {
        public ProfileType Type { get; set; }

        public string Name { get; set; }

        public string Motto { get; set; }

        public string Bio { get; set; }

        public string StudioName { get; set; }

        public string Country { get; set; }

        public string Location { get; set; }

        public bool HasCoverImage { get; set; }

        public List<ExternalLinkVo> ExternalLinks { get; set; }

        public List<UserFollow> Followers { get; set; }

        public UserProfile()
        {
            ExternalLinks = new List<ExternalLinkVo>();
        }
    }
}