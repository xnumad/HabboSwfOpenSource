package com.sulake.core.runtime
{
    public class ComponentDependency 
    {
        private var _identifier:IID;
        private var _dependencySetter:Function;
        private var _isRequired:Boolean;
        private var _eventListeners:Array;

        public function ComponentDependency(identifier:IID, dependecySetter:Function, isRequired:Boolean=true, eventListeners:Array=null)
        {
            this._identifier = identifier;
            this._dependencySetter = dependecySetter;
            this._isRequired = isRequired;
            this._eventListeners = eventListeners;
        }

        internal function get identifier():IID
        {
            return this._identifier;
        }

        internal function get dependencySetter():Function
        {
            return this._dependencySetter;
        }

        internal function get isRequired():Boolean
        {
            return this._isRequired;
        }

        internal function get eventListeners():Array
        {
            return this._eventListeners;
        }
    }
}
