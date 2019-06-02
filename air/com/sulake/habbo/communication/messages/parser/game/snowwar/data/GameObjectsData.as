//com.sulake.habbo.communication.messages.parser.game.snowwar.data.GameObjectsData

package com.sulake.habbo.communication.messages.parser.game.snowwar.data{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GameObjectsData {

        private var _gameObjects:Array;

        public function GameObjectsData(k:IMessageDataWrapper);

        public function get gameObjects():Array;

        public function parse(k:IMessageDataWrapper):void;


    }
}//package com.sulake.habbo.communication.messages.parser.game.snowwar.data

