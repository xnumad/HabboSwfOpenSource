//com.sulake.habbo.communication.messages.parser.room.engine.RoomVisualizationSettingsParser

package com.sulake.habbo.communication.messages.parser.room.engine{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class RoomVisualizationSettingsParser implements IMessageParser {

        private var _wallsHidden:Boolean;
        private var _wallThicknessMultiplier:Number;
        private var _floorThicknessMultiplier:Number;

        public function RoomVisualizationSettingsParser();

        public function get wallsHidden():Boolean;

        public function get wallThicknessMultiplier():Number;

        public function get floorThicknessMultiplier():Number;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.engine

