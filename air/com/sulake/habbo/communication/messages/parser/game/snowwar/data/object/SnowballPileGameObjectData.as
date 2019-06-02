//com.sulake.habbo.communication.messages.parser.game.snowwar.data.object.SnowballPileGameObjectData

package com.sulake.habbo.communication.messages.parser.game.snowwar.data.object{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class SnowballPileGameObjectData extends SnowWarGameObjectData {

        public static const NUM_OF_VARIABLES:int;

        public function SnowballPileGameObjectData(k:int, _arg_2:int);

        override public function parse(k:IMessageDataWrapper):void;

        public function get locationX3D():int;

        public function get locationY3D():int;

        public function get maxSnowballs():int;

        public function get snowballCount():int;

        public function get fuseObjectId():int;


    }
}//package com.sulake.habbo.communication.messages.parser.game.snowwar.data.object

