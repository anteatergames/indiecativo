﻿using System;

namespace IndieVisible.Application
{
    public static class Constants
    {
        public static string UnknownSoul
        {
            get
            {
                return "Unknown soul";
            }
        }

        public static string SoundOfSilence
        {
            get
            {
                return "this is the sound... of silence...";
            }
        }

        public static string DefaultProfileDescription
        {
            get
            {
                return "is a game developer willing to rock the game development world with funny games.";
            }
        }

        public static string DefaultUsername
        {
            get
            {
                return "theuser";
            }
        }

        public static string DefaultAvatar
        {
            get
            {
                return "/images/profileimages/developer.png";
            }
        }

        public static string DefaultProfileCoverImage
        {
            get
            {
                return "/images/placeholders/profilecoverimage.jpg";
            }
        }

        public static string DefaultGameCoverImage
        {
            get
            {
                return "/images/placeholders/gamecoverimage.jpg";
            }
        }

        public static string DefaultGameThumbnail
        {
            get
            {
                return "/images/placeholders/gameplaceholder.png";
            }
        }

        public static string DefaultFeaturedImage
        {
            get
            {
                return "/images/placeholders/featuredimage.jpg";
            }
        }

        public static string DefaultImagePath
        {
            get
            {
                return "/storage/image";
            }
        }

        public static string DefaultUserImagePath
        {
            get
            {
                return "/storage/userimage";
            }
        }

        public static string DefaultCloudinaryPath
        {
            get
            {
                return "https://res.cloudinary.com/ludustack/image/upload/f_auto/";
            }
        }

        public static string DefaultAvatarPlaceholder
        {
            get
            {
                return String.Format("{0},q_auto/v1/xpto/profileimage_xpto_Personal", DefaultCloudinaryPath);
            }
        }

        public static string DefaultIndieVisiblePath
        {
            get
            {
                return "https://www.indievisible.net/";
            }
        }

        public static string DefaultCdnPath
        {
            get
            {
                return "https://indievisiblecdn.azureedge.net/";
            }
        }

        public static string DefaultAzureStoragePath
        {
            get
            {
                return "https://indievisible.blob.core.windows.net/";
            }
        }


        public static string DefaultCourseThumbnail
        {
            get
            {
                return "/images/placeholders/courseplaceholder.png";
            }
        }
    }
}