using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace KVDemoApi.Infrastructure
{
    public interface IMainRepository<T> where T:class
    {
        IQueryable<T> GetAll();
        // T GetSingle(int TId);
        IQueryable<T> FindBy(Expression<Func<T, bool>> predicate);
        void Add(T entity);
        void Delete(T entity);
        void Edit(T entity);
        void Save();
        Task<T> GetSingle(Expression<Func<T, bool>> predicate);
    }
}
