//com.sulake.habbo.chat.discussion.viewer.ChatView

package com.sulake.habbo.chat.discussion.viewer{
    import com.sulake.core.runtime.IUpdateReceiver;
    import com.sulake.habbo.chat.Chat;
    import starling.display.Sprite;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.chat.discussion.viewer.visualization.Bubble;
    import starling.display.DisplayObjectContainer;
    import com.sulake.room.utils.IVector3d;
    import flash.geom.Point;

    public class ChatView implements IUpdateReceiver {

        private const MOVE_INTERVAL_SLOW_MS:int;
        private const MOVE_INTERVAL_NORMAL_MS:int;
        private const MOVE_INTERVAL_FAST_MS:int;
        private const MOVE_INTERVAL_SUPER_FAST_MS:int;
        private const DEFAULT_CHAT_BOTTOM:int;
        private const NORMAL_BOTTOM_OFFSET:int;
        private const FAST_BOTTOM_OFFSET:int;
        private const SUPER_FAST_BOTTOM_OFFSET:int;
        private const MOVE_AMOUNT_PX:int;
        private const OVERLAP_AMOUNT_PX:int;
        private var _chat:Chat;
        private var _canvas:Sprite;
        private var _lastUpdateStamp:uint;
        private var _moveIntervalMs:int;
        private var _bubbles:Vector.<Bubble>;

        public function ChatView(k:Chat);

        public function dispose():void;

        public function get disposed():Boolean;

        public function updateTextures():void;

        public function insertBubble(k:Bubble):void;

        public function update(k:uint):void;

        public function get canvas():DisplayObjectContainer;

        private function calculateMoveInterval():int;

        public function getScreenPointFromRoomLocation(k:int, _arg_2:IVector3d):Point;


    }
}//package com.sulake.habbo.chat.discussion.viewer

