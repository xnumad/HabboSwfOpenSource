//com.sulake.habbo.avatar.actions.ActionDefinition

package com.sulake.habbo.avatar.actions{
    import __AS3__.vec.Vector;
    import com.sulake.core.utils.Map;
    import flash.utils.Dictionary;

    public class ActionDefinition implements IActionDefinition {

        private var _id:String;
        private var _state:String;
        private var _precedence:int;
        private var _activePartSet:String;
        private var _assetPartDefinition:String;
        private var _lay:String;
        private var _geometryType:String;
        private var _isMain:Boolean;
        private var _isDefault:Boolean;
        private var _isAnimation:Boolean;
        private var _startFromFrameZero:Boolean;
        private var _prevents:Vector.<String>;
        private var _preventHeadTurn:Boolean;
        private var _canvasOffsets:Map;
        private var _types:Dictionary;
        private var _params:Dictionary;
        private var _defaultParameterValue:String;

        public function ActionDefinition(k:XML);

        public function setOffsets(k:String, _arg_2:int, _arg_3:Array):void;

        public function getOffsets(k:String, _arg_2:int):Array;

        public function getParameterValue(k:String):String;

        private function getTypePrevents(k:String):Vector.<String>;

        public function toString():String;

        public function get id():String;

        public function get state():String;

        public function get precedence():int;

        public function get activePartSet():String;

        public function get isMain():Boolean;

        public function get isDefault():Boolean;

        public function get assetPartDefinition():String;

        public function get lay():String;

        public function get geometryType():String;

        public function get isAnimation():Boolean;

        public function getPrevents(k:String):Vector.<String>;

        public function getPreventHeadTurn(k:String):Boolean;

        public function isAnimated(k:String):Boolean;

        public function get startFromFrameZero():Boolean;

        public function get params():Dictionary;


    }
}//package com.sulake.habbo.avatar.actions

