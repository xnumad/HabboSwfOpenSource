//com.sulake.habbo.chat.discussion.viewer.visualization.style.ChatStyleLibrary

package com.sulake.habbo.chat.discussion.viewer.visualization.style{
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.utils.Map;
    import flash.geom.Point;
    import flash.geom.Rectangle;

    public class ChatStyleLibrary {

        private static const DEFAULT_STYLE:int;

        private var _assets:IAssetLibrary;
        private var _styles:Map;

        public function ChatStyleLibrary(k:IAssetLibrary);

        public function dispose():void;

        private function initializeStyleFromAssets(k:String, _arg_2:Boolean=false, _arg_3:Boolean=false, _arg_4:Boolean=false):ChatStyle;

        private function hasConfig(k:String, _arg_2:String):Boolean;

        private function getConfigCSV(k:String, _arg_2:String):Array;

        private function getConfigPoint(k:String, _arg_2:String):Point;

        private function getConfigRect(k:String, _arg_2:String):Rectangle;

        public function getStyleIds():Array;

        public function getStyle(k:int):ChatStyle;

        public function updateTextures():void;


    }
}//package com.sulake.habbo.chat.discussion.viewer.visualization.style

