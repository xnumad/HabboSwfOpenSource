package com.sulake.habbo.ui.widget.avatarinfo.botskills
{
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.ui.widget.avatarinfo.AvatarInfoWidget;
    import com.sulake.core.window.IWindowContainer;
    import flash.geom.Rectangle;
    import com.sulake.habbo.communication.messages.incoming.room.bots.BotCommandConfigurationEvent;
    import com.sulake.habbo.communication.messages.outgoing._Str_416._Str_12054;
    import flash.geom.Point;

    public class BotSkillConfigurationViewBase implements BotSkillConfigurationView 
    {
        private var _Str_9057:IMessageEvent;
        protected var _Str_2268:AvatarInfoWidget;
        protected var window:IWindowContainer;
        protected var _Str_2753:int;

        public function BotSkillConfigurationViewBase(k:AvatarInfoWidget)
        {
            this._Str_2268 = k;
        }

        public function dispose():void
        {
            if (this.window)
            {
                this.window.dispose();
                this.window = null;
            }
            if (this._Str_2268)
            {
                if (((this._Str_2268.handler.container.connection) && (this._Str_9057)))
                {
                    this._Str_2268.handler.container.connection.removeMessageEvent(this._Str_9057);
                    this._Str_9057 = null;
                }
                this._Str_2268 = null;
            }
            this._Str_2753 = -1;
        }

        public function get disposed():Boolean
        {
            return this._Str_2268 == null;
        }

        public function open(k:int, _arg_2:Point=null):void
        {
            var _local_3:XML;
            var _local_4:Rectangle;
            this._Str_2753 = k;
            if (!this._Str_9057)
            {
                this._Str_9057 = new BotCommandConfigurationEvent(this._Str_22412);
                this._Str_2268.handler.container.connection.addMessageEvent(this._Str_9057);
            }
            this._Str_2268.handler.container.connection.send(new _Str_12054(this._Str_2753, this.skillType));
            if (!this.window)
            {
                _local_3 = (this._Str_2268.assets.getAssetByName(this.windowAssetName).content as XML);
                this.window = (this._Str_2268.windowManager.buildFromXML(_local_3, 1) as IWindowContainer);
            }
            if (_arg_2)
            {
                _local_4 = this.window.rectangle;
                this.window.x = (_arg_2.x - (_local_4.width / 2));
                this.window.y = (_arg_2.y - _local_4.height);
            }
            this._Str_23587();
            this.window.visible = true;
            this.deactivateInputs();
        }

        public function close():void
        {
            if (this.window)
            {
                this.window.dispose();
                this.window = null;
            }
        }

        public function parseConfiguration(k:String):void
        {
        }

        protected function deactivateInputs():void
        {
        }

        protected function get windowAssetName():String
        {
            return "";
        }

        protected function get skillType():int
        {
            return -1;
        }

        private function _Str_22412(k:BotCommandConfigurationEvent):void
        {
            if (((k.getParser()._Str_5455 == this._Str_2753) && (k.getParser().commandId == this.skillType)))
            {
                this.parseConfiguration(k.getParser().data);
            }
        }

        private function _Str_23587():void
        {
            var k:Rectangle = new Rectangle();
            this.window.getGlobalRectangle(k);
            if (k.top < 0)
            {
                this.window.y = (this.window.y + -(k.top));
            }
            if (k.left < 0)
            {
                this.window.x = (this.window.x + -(k.left));
            }
            if (k.right > this.window.desktop.width)
            {
                this.window.x = (this.window.x - (k.right - this.window.desktop.width));
            }
            if (k.bottom > this.window.desktop.height)
            {
                this.window.y = (this.window.y - (k.bottom - this.window.desktop.height));
            }
        }
    }
}
