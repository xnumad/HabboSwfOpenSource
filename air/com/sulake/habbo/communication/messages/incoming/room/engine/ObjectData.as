//com.sulake.habbo.communication.messages.incoming.room.engine.ObjectData

package com.sulake.habbo.communication.messages.incoming.room.engine{
    import com.sulake.habbo.room.IStuffData;

    public class ObjectData {

        private var _id:int;
        private var _state:int;
        private var _data:IStuffData;

        public function ObjectData(k:int, _arg_2:int, _arg_3:IStuffData);

        public function get id():int;

        public function get state():int;

        public function get data():IStuffData;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.engine

