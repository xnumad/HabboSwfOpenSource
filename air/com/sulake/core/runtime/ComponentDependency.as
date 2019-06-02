//com.sulake.core.runtime.ComponentDependency

package com.sulake.core.runtime{
    public class ComponentDependency {

        private var _identifier:IID;
        private var _dependencySetter:Function;
        private var _isRequired:Boolean;
        private var _eventListeners:Array;

        public function ComponentDependency(k:IID, _arg_2:Function, _arg_3:Boolean=true, _arg_4:Array=null);

        function get identifier():IID;

        function get dependencySetter():Function;

        function get isRequired():Boolean;

        function get eventListeners():Array;


    }
}//package com.sulake.core.runtime

