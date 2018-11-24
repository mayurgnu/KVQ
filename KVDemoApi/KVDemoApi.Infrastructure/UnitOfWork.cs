using KVDemoApi.Core.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace KVDemoApi.Infrastructure
{
    public class UnitOfWork : IUnitOfWork
    {
        protected MPContext db;
        public UnitOfWork(MPContext _db)
        {
            db = _db;
        }
        private IMainRepository<TblUser> userRepository;
        public IMainRepository<TblUser> TblUser_Repository
        {
            get
            {
                if (userRepository == null)
                    userRepository = new MainRepository<TblUser>(db);
                return userRepository;
            }
       }
    }
}
