using KVDemoApi.Core.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace KVDemoApi.Infrastructure
{
    public class MainRepository<T> : IMainRepository<T> where T : class
    {

        private MPContext context;
        public MainRepository(MPContext _context)
        {
            context = _context;
        }

        public virtual IQueryable<T> GetAll()
        {

            IQueryable<T> query = context.Set<T>();
            return query;
        }

        public IQueryable<T> FindBy(System.Linq.Expressions.Expression<Func<T, bool>> predicate)
        {

            IQueryable<T> query = context.Set<T>().Where(predicate);
            return query;
        }

        public virtual void Add(T entity)
        {
            context.Set<T>().Add(entity);
        }

        public virtual void Delete(T entity)
        {
            context.Set<T>().Remove(entity);
        }

        public virtual void Edit(T entity)
        {
            context.Entry(entity).State = EntityState.Modified;
        }
        public virtual async Task<T> GetSingle(Expression<Func<T, bool>> predicate)
        {
            return await context.Set<T>().Where(predicate).FirstOrDefaultAsync();
        }
        public virtual void Save()
        {
            context.SaveChanges();
        }
    }
}
