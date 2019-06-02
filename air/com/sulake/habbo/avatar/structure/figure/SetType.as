//com.sulake.habbo.avatar.structure.figure.SetType

package com.sulake.habbo.avatar.structure.figure{
    import com.sulake.core.utils.Map;
    import flash.utils.Dictionary;

    public class SetType implements ISetType {

        private var _partSets:Map;
        private var _type:String;
        private var _paletteID:int;
        private var _isMandatory:Dictionary;

        public function SetType(k:XML);

        public function dispose():void;

        public function cleanUp(k:XML):void;

        public function append(k:XML):void;

        public function getDefaultPartSet(k:String):IFigurePartSet;

        public function getPartSet(k:int):IFigurePartSet;

        public function get type():String;

        public function get paletteID():int;

        public function isMandatory(k:String, _arg_2:int):Boolean;

        public function optionalFromClubLevel(k:String):int;

        public function get partSets():Map;


    }
}//package com.sulake.habbo.avatar.structure.figure

