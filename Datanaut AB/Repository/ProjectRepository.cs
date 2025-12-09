using Datanaut_AB.Data;
using Datanaut_AB.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datanaut_AB.Repository
{

    public class ProjectRepository
    {
        private readonly DatanautDBContext _context;
        public ProjectRepository(DatanautDBContext context)
        {
            _context = context;
        }
        public Task<List<Project>> GetAllProjects()
            => _context.Projects.ToListAsync();
    }
}
