//com.sulake.habbo.communication.messages.parser.game.snowwar.data.FuseObjectData

package com.sulake.habbo.communication.messages.parser.game.snowwar.data{
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class FuseObjectData {

        private var _name:String;
        private var _id:int;
        private var _x:int;
        private var _y:int;
        private var _xDimension:int;
        private var _yDimension:int;
        private var _height:int;
        private var _direction:int;
        private var _altitude:int;
        private var _canStandOn:Boolean;
        private var _stuffData:IStuffData;

        public function FuseObjectData();

        public function parse(k:IMessageDataWrapper):void;

        public function get name():String;

        public function get id():int;

        public function get x():int;

        public function get y():int;

        public function get xDimension():int;

        public function get yDimension():int;

        public function get height():int;

        public function get direction():int;

        public function get altitude():int;

        public function get canStandOn():Boolean;

        public function get stuffData():IStuffData;


    }
}//package com.sulake.habbo.communication.messages.parser.game.snowwar.data

