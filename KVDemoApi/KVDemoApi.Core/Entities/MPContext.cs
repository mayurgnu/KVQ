using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace KVDemoApi.Core.Entities
{
    public partial class MPContext : DbContext
    {
        public MPContext()
        {
        }

        public MPContext(DbContextOptions<MPContext> options)
            : base(options)
        {
        }

        public virtual DbSet<TblCities> TblCities { get; set; }
        public virtual DbSet<TblRole> TblRole { get; set; }
        public virtual DbSet<TblUser> TblUser { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("data source=DESKTOP-4VG8BV2\\SQLEXPRESS; initial catalog=MP;Integrated Security=true");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<TblCities>(entity =>
            {
                entity.HasKey(e => e.CityId);

                entity.ToTable("tblCities");

                entity.Property(e => e.CityId).HasColumnName("CityID");

                entity.Property(e => e.CityName)
                    .IsRequired()
                    .HasMaxLength(20)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<TblRole>(entity =>
            {
                entity.ToTable("tblRole");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Createddate)
                    .HasColumnName("createddate")
                    .HasColumnType("datetime");

                entity.Property(e => e.Description)
                    .HasColumnName("description")
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<TblUser>(entity =>
            {
                entity.ToTable("tblUser");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Address)
                    .HasColumnName("address")
                    .HasMaxLength(100);

                entity.Property(e => e.Birthdate)
                    .HasColumnName("birthdate")
                    .HasColumnType("date");

                entity.Property(e => e.Cityid).HasColumnName("cityid");

                entity.Property(e => e.Contactno)
                    .HasColumnName("contactno")
                    .HasMaxLength(25);

                entity.Property(e => e.Countryid).HasColumnName("countryid");

                entity.Property(e => e.Email)
                    .IsRequired()
                    .HasColumnName("email")
                    .HasMaxLength(100);

                entity.Property(e => e.Firstname)
                    .HasColumnName("firstname")
                    .HasMaxLength(50);

                entity.Property(e => e.Gender).HasColumnName("gender");

                entity.Property(e => e.Isemailverified).HasColumnName("isemailverified");

                entity.Property(e => e.Isloginallowed).HasColumnName("isloginallowed");

                entity.Property(e => e.Lastname)
                    .HasColumnName("lastname")
                    .HasMaxLength(50);

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasColumnName("password")
                    .HasMaxLength(50);

                entity.Property(e => e.Profilepicture)
                    .HasColumnName("profilepicture")
                    .HasMaxLength(500);

                entity.Property(e => e.Stateid).HasColumnName("stateid");

                entity.Property(e => e.Username)
                    .IsRequired()
                    .HasColumnName("username")
                    .HasMaxLength(50);
            });
        }
    }
}
