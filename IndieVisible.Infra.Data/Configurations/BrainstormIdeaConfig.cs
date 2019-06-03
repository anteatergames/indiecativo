﻿using IndieVisible.Domain.Core.Enums;
using IndieVisible.Domain.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;

namespace IndieVisible.Infra.Data.Mappings
{
    public class BrainstormIdeaConfig : IEntityTypeConfiguration<BrainstormIdea>
    {
        public void Configure(EntityTypeBuilder<BrainstormIdea> builder)
        {
            builder.Property(c => c.Id)
                .HasColumnName("Id");

            builder.Property(x => x.CreateDate)
                .HasDefaultValueSql("getdate()");

            builder.Property(c => c.Title)
                .HasColumnType("nvarchar(128)")
                .HasMaxLength(128);

            builder.Property(c => c.Description)
                .HasColumnType("nvarchar(1024)")
                .HasMaxLength(1024);

            builder.HasOne(x => x.Session)
                .WithMany(x => x.Ideas)
                .HasForeignKey(x => x.SessionId);

            builder.HasMany(x => x.Comments)
                .WithOne(x => x.Idea)
                .HasForeignKey(x => x.IdeaId);

            builder.HasMany(x => x.Votes)
                .WithOne(x => x.Idea)
                .HasForeignKey(x => x.IdeaId);
        }
    }
}
