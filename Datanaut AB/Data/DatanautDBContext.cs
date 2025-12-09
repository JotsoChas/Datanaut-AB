using System;
using System.Collections.Generic;
using Datanaut_AB.Models;
using Microsoft.EntityFrameworkCore;

namespace Datanaut_AB.Data;

public partial class DatanautDBContext : DbContext
{
    public DatanautDBContext()
    {
    }

    public DatanautDBContext(DbContextOptions<DatanautDBContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Activity> Activities { get; set; }

    public virtual DbSet<Member> Members { get; set; }

    public virtual DbSet<MemberSkill> MemberSkills { get; set; }

    public virtual DbSet<Project> Projects { get; set; }

    public virtual DbSet<ProjectMember> ProjectMembers { get; set; }

    public virtual DbSet<ProjectResource> ProjectResources { get; set; }

    public virtual DbSet<ProjectStatus> ProjectStatuses { get; set; }

    public virtual DbSet<Resource> Resources { get; set; }

    public virtual DbSet<Role> Roles { get; set; }

    public virtual DbSet<Skill> Skills { get; set; }

    public virtual DbSet<TimeLog> TimeLogs { get; set; }

    public virtual DbSet<VwProjectTotalHour> VwProjectTotalHours { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=(localdb)\\MSSQLLocalDB;Database=DatanautDB;Trusted_Connection=True;TrustServerCertificate=True");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Activity>(entity =>
        {
            entity.HasKey(e => e.ActivityId).HasName("PK__Activity__45F4A7F11E3DA423");

            entity.ToTable("Activity");

            entity.Property(e => e.ActivityId).HasColumnName("ActivityID");
            entity.Property(e => e.ActivityName).HasMaxLength(100);
            entity.Property(e => e.CreatedAt).HasDefaultValueSql("(sysdatetime())");
        });

        modelBuilder.Entity<Member>(entity =>
        {
            entity.HasKey(e => e.MemberId).HasName("PK__Member__0CF04B383D881A16");

            entity.ToTable("Member");

            entity.HasIndex(e => e.Username, "UQ_Member_Username").IsUnique();

            entity.Property(e => e.MemberId).HasColumnName("MemberID");
            entity.Property(e => e.CreatedAt).HasDefaultValueSql("(sysdatetime())");
            entity.Property(e => e.FirstName).HasMaxLength(100);
            entity.Property(e => e.IsActive).HasDefaultValue(true);
            entity.Property(e => e.LastName).HasMaxLength(100);
            entity.Property(e => e.RoleId).HasColumnName("RoleID");
            entity.Property(e => e.Username).HasMaxLength(100);

            entity.HasOne(d => d.Role).WithMany(p => p.Members)
                .HasForeignKey(d => d.RoleId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Member__RoleID__4CA06362");
        });

        modelBuilder.Entity<MemberSkill>(entity =>
        {
            entity.HasKey(e => e.MemberSkillId).HasName("PK__MemberSk__244C956EB87F45DF");

            entity.ToTable("MemberSkill");

            entity.Property(e => e.MemberSkillId).HasColumnName("MemberSkillID");
            entity.Property(e => e.CreatedAt).HasDefaultValueSql("(sysdatetime())");
            entity.Property(e => e.MemberId).HasColumnName("MemberID");
            entity.Property(e => e.SkillId).HasColumnName("SkillID");

            entity.HasOne(d => d.Member).WithMany(p => p.MemberSkills)
                .HasForeignKey(d => d.MemberId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__MemberSki__Membe__5165187F");

            entity.HasOne(d => d.Skill).WithMany(p => p.MemberSkills)
                .HasForeignKey(d => d.SkillId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__MemberSki__Skill__52593CB8");
        });

        modelBuilder.Entity<Project>(entity =>
        {
            entity.HasKey(e => e.ProjectId).HasName("PK__Project__761ABED075725C93");

            entity.ToTable("Project", tb =>
                {
                    tb.HasTrigger("TR_Project_SetCreatedAt");
                    tb.HasTrigger("TR_Project_SetUpdatedAt");
                });

            entity.Property(e => e.ProjectId).HasColumnName("ProjectID");
            entity.Property(e => e.Budget).HasColumnType("decimal(18, 2)");
            entity.Property(e => e.CreatedAt).HasDefaultValueSql("(sysdatetime())");
            entity.Property(e => e.Name).HasMaxLength(100);
            entity.Property(e => e.ProjectManagerId).HasColumnName("ProjectManagerID");
            entity.Property(e => e.ProjectStatusId).HasColumnName("ProjectStatusID");

            entity.HasOne(d => d.ProjectManager).WithMany(p => p.Projects)
                .HasForeignKey(d => d.ProjectManagerId)
                .HasConstraintName("FK__Project__Project__5629CD9C");

            entity.HasOne(d => d.ProjectStatus).WithMany(p => p.Projects)
                .HasForeignKey(d => d.ProjectStatusId)
                .HasConstraintName("FK__Project__Project__5535A963");
        });

        modelBuilder.Entity<ProjectMember>(entity =>
        {
            entity.HasKey(e => e.ProjectMemberId).HasName("PK__ProjectM__E4E9983C4569AD1E");

            entity.ToTable("ProjectMember");

            entity.Property(e => e.ProjectMemberId).HasColumnName("ProjectMemberID");
            entity.Property(e => e.CreatedAt).HasDefaultValueSql("(sysdatetime())");
            entity.Property(e => e.MemberId).HasColumnName("MemberID");
            entity.Property(e => e.ProjectId).HasColumnName("ProjectID");

            entity.HasOne(d => d.Member).WithMany(p => p.ProjectMembers)
                .HasForeignKey(d => d.MemberId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__ProjectMe__Membe__59FA5E80");

            entity.HasOne(d => d.Project).WithMany(p => p.ProjectMembers)
                .HasForeignKey(d => d.ProjectId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__ProjectMe__Proje__59063A47");
        });

        modelBuilder.Entity<ProjectResource>(entity =>
        {
            entity.HasKey(e => e.ProjectResourceId).HasName("PK__ProjectR__C3C6C27253B15B2B");

            entity.ToTable("ProjectResource");

            entity.Property(e => e.ProjectResourceId).HasColumnName("ProjectResourceID");
            entity.Property(e => e.CreatedAt).HasDefaultValueSql("(sysdatetime())");
            entity.Property(e => e.ProjectId).HasColumnName("ProjectID");
            entity.Property(e => e.ResourceId).HasColumnName("ResourceID");

            entity.HasOne(d => d.Project).WithMany(p => p.ProjectResources)
                .HasForeignKey(d => d.ProjectId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__ProjectRe__Proje__66603565");

            entity.HasOne(d => d.Resource).WithMany(p => p.ProjectResources)
                .HasForeignKey(d => d.ResourceId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__ProjectRe__Resou__6754599E");
        });

        modelBuilder.Entity<ProjectStatus>(entity =>
        {
            entity.HasKey(e => e.ProjectStatusId).HasName("PK__ProjectS__F3B67D2D974FD5E8");

            entity.ToTable("ProjectStatus");

            entity.HasIndex(e => e.StatusName, "UQ_ProjectStatus_StatusName").IsUnique();

            entity.Property(e => e.ProjectStatusId).HasColumnName("ProjectStatusID");
            entity.Property(e => e.StatusName).HasMaxLength(100);
        });

        modelBuilder.Entity<Resource>(entity =>
        {
            entity.HasKey(e => e.ResourceId).HasName("PK__Resource__4ED1814FA8F05C07");

            entity.ToTable("Resource");

            entity.HasIndex(e => e.LicenseKey, "UQ_Resource_LicenseKey_Filtered")
                .IsUnique()
                .HasFilter("([LicenseKey] IS NOT NULL)");

            entity.Property(e => e.ResourceId).HasColumnName("ResourceID");
            entity.Property(e => e.CreatedAt).HasDefaultValueSql("(sysdatetime())");
            entity.Property(e => e.IsAvailable).HasDefaultValue(true);
            entity.Property(e => e.LicenseKey).HasMaxLength(200);
            entity.Property(e => e.Name).HasMaxLength(100);
            entity.Property(e => e.Type).HasMaxLength(100);
        });

        modelBuilder.Entity<Role>(entity =>
        {
            entity.HasKey(e => e.RoleId).HasName("PK__Role__8AFACE3AF65C645A");

            entity.ToTable("Role");

            entity.HasIndex(e => e.RoleName, "UQ_Role_RoleName").IsUnique();

            entity.Property(e => e.RoleId).HasColumnName("RoleID");
            entity.Property(e => e.RoleName).HasMaxLength(100);
        });

        modelBuilder.Entity<Skill>(entity =>
        {
            entity.HasKey(e => e.SkillId).HasName("PK__Skill__DFA091E72DBB154F");

            entity.ToTable("Skill");

            entity.HasIndex(e => e.Name, "UQ_Skill_Name").IsUnique();

            entity.Property(e => e.SkillId).HasColumnName("SkillID");
            entity.Property(e => e.CreatedAt).HasDefaultValueSql("(sysdatetime())");
            entity.Property(e => e.Name).HasMaxLength(100);
        });

        modelBuilder.Entity<TimeLog>(entity =>
        {
            entity.HasKey(e => e.TimeLogId).HasName("PK__TimeLog__26E437B7801EF8B8");

            entity.ToTable("TimeLog");

            entity.Property(e => e.TimeLogId).HasColumnName("TimeLogID");
            entity.Property(e => e.ActivityId).HasColumnName("ActivityID");
            entity.Property(e => e.CreatedAt).HasDefaultValueSql("(sysdatetime())");
            entity.Property(e => e.MemberId).HasColumnName("MemberID");
            entity.Property(e => e.Notes).HasMaxLength(500);
            entity.Property(e => e.ProjectId).HasColumnName("ProjectID");
            entity.Property(e => e.TotalHours).HasColumnType("decimal(5, 2)");

            entity.HasOne(d => d.Activity).WithMany(p => p.TimeLogs)
                .HasForeignKey(d => d.ActivityId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__TimeLog__Activit__60A75C0F");

            entity.HasOne(d => d.Member).WithMany(p => p.TimeLogs)
                .HasForeignKey(d => d.MemberId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__TimeLog__MemberI__5EBF139D");

            entity.HasOne(d => d.Project).WithMany(p => p.TimeLogs)
                .HasForeignKey(d => d.ProjectId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__TimeLog__Project__5FB337D6");
        });

        modelBuilder.Entity<VwProjectTotalHour>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("vw_ProjectTotalHours");

            entity.Property(e => e.ProjectId).HasColumnName("ProjectID");
            entity.Property(e => e.ProjectName).HasMaxLength(100);
            entity.Property(e => e.TotalHoursLogged).HasColumnType("decimal(38, 2)");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
