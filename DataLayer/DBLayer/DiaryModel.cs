namespace DataLayer.DBLayer
{
	using System;
	using System.Data.Entity;
	using System.ComponentModel.DataAnnotations.Schema;
	using System.Linq;

	public partial class DiaryContext : DbContext
	{
		public DiaryContext()
			: base("name=DiaryConnectionString")
		{
		}

		public virtual DbSet<Task> Tasks { get; set; }
		public virtual DbSet<User> Users { get; set; }

		protected override void OnModelCreating(DbModelBuilder modelBuilder)
		{
			modelBuilder.Entity<User>()
				.HasMany(e => e.Tasks)
				.WithMany(e => e.Users)
				.Map(m => m.ToTable("UserTask").MapLeftKey("IdUser").MapRightKey("IdTask"));
		}
	}
}
