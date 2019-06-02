//com.sulake.habbo.communication.messages.parser.game.snowwar.data.object.TreeGameObjectData

package com.sulake.habbo.communication.messages.parser.game.snowwar.data.object{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class TreeGameObjectData extends SnowWarGameObjectData {

        public static const NUM_OF_VARIABLES:int;

        public function TreeGameObjectData(k:int, _arg_2:int);

        override public function parse(k:IMessageDataWrapper):void;

        public function get locationX3D():int;

        public function get locationY3D():int;

        public function get direction():int;

        public function get height():int;

        public function get fuseObjectId():int;

        public function get maxHits():int;

        public function get hits():int;


    }
}//package com.sulake.habbo.communication.messages.parser.game.snowwar.data.object

