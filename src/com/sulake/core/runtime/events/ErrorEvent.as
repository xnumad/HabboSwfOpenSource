package com.sulake.core.runtime.events
{
    public class ErrorEvent extends WarningEvent 
    {
        protected var _category:int;
        protected var _critical:Boolean;
        protected var _error:Error;

        public function ErrorEvent(type:String, message:String, critical:Boolean, category:int, error:Error=null)
        {
            this._critical = critical;
            this._category = category;
            this._error = error;
            super(type, message);
        }

        public function get category():int
        {
            return this._category;
        }

        public function get critical():Boolean
        {
            return this._critical;
        }

        public function get error():Error
        {
            return this._error;
        }
    }
}
