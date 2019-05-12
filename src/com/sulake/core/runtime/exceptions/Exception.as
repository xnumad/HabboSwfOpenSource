package com.sulake.core.runtime.exceptions
{
    import flash.utils.getQualifiedClassName;

    public class Exception extends Error 
    {
        private var _cause:Error;

        public function Exception(message:String, id:int=0, cause:Error=null)
        {
            super(message, id);
            this._cause = cause;
        }

        public static function getChainedStackTrace(error:Error):String
        {
            var stacktrace:String;
            var out:String;
            while (error != null)
            {
                stacktrace = error.getStackTrace();
                if (stacktrace != null)
                {
                    if (out == null)
                    {
                        out = stacktrace;
                    }
                    else
                    {
                        out = (out + "\ncaused by ");
                        out = (out + stacktrace);
                    }
                }
                if ((error is Exception))
                {
                    error = (error as Exception).cause;
                }
                else
                {
                    error = null;
                }
            }
            return out;
        }


        public function get cause():Error
        {
            return this._cause;
        }

        public function toString():String
        {
            var message:String = ((getQualifiedClassName(this) + ": ") + super.message);
            if (this._cause != null)
            {
                message = (message + ", caused by ");
                message = (message + this._cause.toString());
            }
            return message;
        }
    }
}
