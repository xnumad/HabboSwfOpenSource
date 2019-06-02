//com.sulake.habbo.avatar.AvatarFigureContainer

package com.sulake.habbo.avatar{
    import com.sulake.core.utils.Map;

    public class AvatarFigureContainer implements IAvatarFigureContainer {

        private var _serialized:String;
        private var _parts:Map;

        public function AvatarFigureContainer(k:String);

        public function toString():String;

        public function getPartTypeIds():Array;

        public function hasPartType(k:String):Boolean;

        public function getPartSetId(k:String):int;

        public function getPartColorIds(k:String):Array;

        public function updatePart(k:String, _arg_2:int, _arg_3:Array):void;

        public function removePart(k:String):void;

        public function getFigureString():String;

        private function parseFigureString(k:String):void;


    }
}//package com.sulake.habbo.avatar

