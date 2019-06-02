//com.sulake.habbo.chat.discussion.viewer.BubbleFactory

package com.sulake.habbo.chat.discussion.viewer{
    import com.sulake.habbo.chat.Chat;
    import com.sulake.habbo.chat.discussion.viewer.visualization.style.ChatStyleLibrary;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.chat.discussion.viewer.visualization.Bubble;
    import com.sulake.habbo.chat.discussion.data.ChatItem;

    public class BubbleFactory {

        private var _chat:Chat;
        private var _chatStyleLibrary:ChatStyleLibrary;
        private var _chatBubblePool:Vector.<Bubble>;
        private var _disposed:Boolean;

        public function BubbleFactory(k:Chat);

        public function dispose():void;

        public function get disposed():Boolean;

        public function allocate(k:ChatItem):Bubble;

        public function recycle(k:Bubble):void;

        public function updateTextures():void;


    }
}//package com.sulake.habbo.chat.discussion.viewer

