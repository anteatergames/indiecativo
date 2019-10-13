﻿using IndieVisible.Domain.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace IndieVisible.Infra.Data.Configurations
{
    public class GameExternalLinkConfig : IEntityTypeConfiguration<GameExternalLink>
    {
        public void Configure(EntityTypeBuilder<GameExternalLink> builder)
        {
            builder.Property(c => c.Id)
                .HasColumnName("Id");

            builder.Property(x => x.CreateDate)
                .HasDefaultValueSql("getdate()");

            builder.Property(x => x.Type)
                .IsRequired();

            builder.Property(x => x.Provider)
                .IsRequired();

            builder.Property(x => x.Value)
                .HasColumnType("nvarchar(256)")
                .HasMaxLength(256)
                .IsRequired();
        }
    }
}
