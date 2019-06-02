//com.sulake.habbo.communication.messages.parser.game.snowwar.data.object.HumanGameObjectData

package com.sulake.habbo.communication.messages.parser.game.snowwar.data.object{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class HumanGameObjectData extends SnowWarGameObjectData {

        public static const NUM_OF_VARIABLES:int;

        private var _name:String;
        private var _mission:String;
        private var _figure:String;
        private var _sex:String;

        public function HumanGameObjectData(k:int, _arg_2:int);

        public function get name():String;

        public function get mission():String;

        public function get figure():String;

        public function get sex():String;

        override public function parse(k:IMessageDataWrapper):void;

        public function get currentLocationX():int;

        public function get currentLocationY():int;

        public function get currentTileX():int;

        public function get currentTileY():int;

        public function get bodyDirection():int;

        public function get hitPoints():int;

        public function get snowBallCount():int;

        public function get isBot():int;

        public function get activityTimer():int;

        public function get activityState():int;

        public function get nextTileX():int;

        public function get nextTileY():int;

        public function get moveTargetX():int;

        public function get moveTargetY():int;

        public function get score():int;

        public function get team():int;

        public function get userId():int;


    }
}//package com.sulake.habbo.communication.messages.parser.game.snowwar.data.object

