using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace KVDemoApi.Utility
{
    public class ApiResponse
    {
        public static object SetResponse(
            ApiResponseStatus responseStatus,
            string message,
            ApiOpStatus operationStatus,
            object data) =>
            new { ResponseStatus = responseStatus, Message = message, OperationStatus = operationStatus, Data = data };
    }

    public enum ApiResponseStatus
    {
        Ok,

        Error
    }

    public enum ApiOpStatus
    {
        Success,

        Failed,

        Error,

        Warning,

        Authorize,

        ValidationFailed
    }
}
