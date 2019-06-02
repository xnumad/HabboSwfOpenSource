//com.sulake.habbo.toolbar.ToolbarItemMeMenu

package com.sulake.habbo.toolbar{
    import com.sulake.habbo.avatar.IAvatarImageListener;
    import com.sulake.habbo.ui.HabboUI;
    import starling.display.Image;
    import starling.display.Button;
    import starling.textures.Texture;
    import com.sulake.habbo.communication.messages.incoming.room.engine.UserChangeMessageEvent;

    public class ToolbarItemMeMenu extends ToolbarItem implements IAvatarImageListener {

        private var _habboUI:HabboUI;
        private var _headBg:Image;
        private var _button:Button;
        private var _isDisposed:Boolean;

        public function ToolbarItemMeMenu(k:String, _arg_2:HabboUI, _arg_3:String, _arg_4:Function);

        public function get disposed():Boolean;

        override public function dispose():void;

        override protected function createView():void;

        private function getOwnAvatarTexture():Texture;

        private function onUserChange(k:UserChangeMessageEvent):void;

        private function updateButton(k:Texture):void;

        public function avatarImageReady(k:String):void;


    }
}//package com.sulake.habbo.toolbar

