//com.sulake.habbo.room.object.visualization.pet.ExperienceData

package com.sulake.habbo.room.object.visualization.pet{
    import flash.display.BitmapData;

    public class ExperienceData {

        private var _canvas:BitmapData;
        private var _ownCanvas:Boolean;
        private var _copy:BitmapData;
        private var _amount:int;
        private var _alpha:int;

        public function ExperienceData(k:BitmapData, _arg_2:Boolean=true);

        public function dispose():void;

        public function get alpha():int;

        public function set alpha(k:int):void;

        public function get image():BitmapData;

        public function setExperience(k:int):void;


    }
}//package com.sulake.habbo.room.object.visualization.pet

