﻿using IndieVisible.Domain.Core.Enums;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace IndieVisible.Application.ViewModels.User
{
    public class ProfileViewModel: BaseViewModel
    {
        public ProfileType Type { get; set; }

        public string UserName { get; set; }

        [Required]
        [Display(Name="Display Name")]
        public string Name { get; set; }

        public string Motto { get; set; }

        public string ProfileImageUrl { get; set; }

        public string CoverImageUrl { get; set; }

        public string Bio { get; set; }

        public string StudioName { get; set; }

        public string Location { get; set; }

        #region ExternalHandles
        public bool HasOtherProfiles { get
            {
                return !string.IsNullOrWhiteSpace(GameJoltUrl)
                    || !string.IsNullOrWhiteSpace(ItchIoUrl)
                    || !string.IsNullOrWhiteSpace(IndieDbUrl)
                    || !string.IsNullOrWhiteSpace(GameDevNetUrl)
                    || !string.IsNullOrWhiteSpace(UnityConnectUrl);
            }
        }
        [Display(Name="Game Jolt")]
        public string GameJoltUrl { get; set; }

        [Display(Name = "Itch.IO")]
        public string ItchIoUrl { get; set; }

        [Display(Name = "IndieDB")]
        public string IndieDbUrl { get; set; }

        [Display(Name = "Gamedev.net")]
        public string GameDevNetUrl { get; set; }

        [Display(Name = "Unity Connect")]
        public string UnityConnectUrl { get; set; } 
        #endregion



        public UserCounters Counters { get; set; }

        public IndieXpCounter IndieXp { get; set; }

        public Dictionary<ExternalLinks, string> ExternalLinks { get; set; }

        public ConnectionControlViewModel ConnectionControl { get; set; }

        public ProfileViewModel()
        {
            Counters = new UserCounters();
            IndieXp = new IndieXpCounter();
            ExternalLinks = new Dictionary<ExternalLinks, string>();
            ConnectionControl = new ConnectionControlViewModel();
        }
    }

    public class IndieXpCounter
    {
        public int Level { get; set; }

        public int LevelXp { get; set; }

        public int NextLevelXp { get; set; }

        public int XpToNextLevel
        {
            get
            {
                return NextLevelXp - LevelXp;
            }
        }

        public int PercentageToNextLevel
        {
            get
            {
                int percentage = (int)Math.Round((double)(100 * LevelXp) / NextLevelXp);

                return percentage;
            }
        }

        public string LevelName { get; set; }
    }

    public class UserCounters
    {
        public int Followers { get; set; }

        public int Following { get; set; }

        public int Connections { get; set; }

        public int Games { get; set; }

        public int Posts { get; set; }

        public int Comments { get; set; }

        public int Jams { get; set; }
    }

    public class ConnectionControlViewModel
    {
        public bool ConnectionIsPending { get; set; }

        public bool CurrentUserConnected { get; set; }

        public bool CurrentUserWantsToFollowMe { get; set; }
    }
}