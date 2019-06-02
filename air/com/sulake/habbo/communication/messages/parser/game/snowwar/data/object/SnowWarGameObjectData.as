//com.sulake.habbo.communication.messages.parser.game.snowwar.data.object.SnowWarGameObjectData

package com.sulake.habbo.communication.messages.parser.game.snowwar.data.object{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class SnowWarGameObjectData {

        public static const OBJECT_TYPE_SNOWBALL:int;
        public static const OBJECT_TYPE_TREE:int;
        public static const OBJECT_TYPE_SNOWBALL_PILE:int;
        public static const OBJECT_TYPE_SNOWBALL_MACHINE:int;
        public static const OBJECT_TYPE_HUMAN:int;

        protected var _variables:Array;

        public function SnowWarGameObjectData(k:int, _arg_2:int);

        public static function create(k:int, _arg_2:int):SnowWarGameObjectData;


        public function get type():int;

        public function get id():int;

        public function getVariable(k:int):int;

        protected function setVariable(k:int, _arg_2:int):void;

        protected function parseVariables(k:IMessageDataWrapper, _arg_2:int):void;

        public function parse(k:IMessageDataWrapper):void;


    }
}//package com.sulake.habbo.communication.messages.parser.game.snowwar.data.object

