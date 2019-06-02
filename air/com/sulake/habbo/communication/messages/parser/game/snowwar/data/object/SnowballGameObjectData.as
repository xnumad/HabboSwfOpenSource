//com.sulake.habbo.communication.messages.parser.game.snowwar.data.object.SnowballGameObjectData

package com.sulake.habbo.communication.messages.parser.game.snowwar.data.object{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class SnowballGameObjectData extends SnowWarGameObjectData {

        public static const NUM_OF_VARIABLES:int;
        public static const TRAJECTORY_QUICK_THROW:int;
        public static const TRAJECTORY_SHORT_LOB:int;
        public static const TRAJECTORY_LONG_LOB:int;

        public function SnowballGameObjectData(k:int, _arg_2:int);

        override public function parse(k:IMessageDataWrapper):void;

        public function get locationX3D():int;

        public function get locationY3D():int;

        public function get locationZ3D():int;

        public function get movementDirection360():int;

        public function get trajectory():int;

        public function get timeToLive():int;

        public function get throwingHuman():int;

        public function get parabolaOffset():int;

        public function get planarVelocity():int;


    }
}//package com.sulake.habbo.communication.messages.parser.game.snowwar.data.object

