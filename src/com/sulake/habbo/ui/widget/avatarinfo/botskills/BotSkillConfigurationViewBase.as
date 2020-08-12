package com.sulake.habbo.ui.widget.avatarinfo.botskills
{
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.ui.widget.avatarinfo.AvatarInfoWidget;
    import com.sulake.core.window.IWindowContainer;
    import flash.geom.Rectangle;
    import com.sulake.habbo.communication.messages.incoming.room.bots.BotCommandConfigurationEvent;
    import com.sulake.habbo.communication.messages.outgoing.room.bots.GetBotCommandConfigurationDataComposer;
    import flash.geom.Point;

    public class BotSkillConfigurationViewBase implements BotSkillConfigurationView 
    {
        private var _Str_9057:IMessageEvent;
        protected var _widget:AvatarInfoWidget;
        protected var window:IWindowContainer;
        protected var _botId:int;

        public function BotSkillConfigurationViewBase(k:AvatarInfoWidget)
        {
            this._widget = k;
        }

        public function dispose():void
        {
            if (this.window)
            {
                this.window.dispose();
                this.window = null;
            }
            if (this._widget)
            {
                if (((this._widget.handler.container.connection) && (this._Str_9057)))
                {
                    this._widget.handler.container.connection.removeMessageEvent(this._Str_9057);
                    this._Str_9057 = null;
                }
                this._widget = null;
            }
            this._botId = -1;
        }

        public function get disposed():Boolean
        {
            return this._widget == null;
        }

        public function open(k:int, _arg_2:Point=null):void
        {
            var _local_3:XML;
            var _local_4:Rectangle;
            this._botId = k;
            if (!this._Str_9057)
            {
                this._Str_9057 = new BotCommandConfigurationEvent(this._Str_22412);
                this._widget.handler.container.connection.addMessageEvent(this._Str_9057);
            }
            this._widget.handler.container.connection.send(new GetBotCommandConfigurationDataComposer(this._botId, this.skillType));
            if (!this.window)
            {
                _local_3 = (this._widget.assets.getAssetByName(this.windowAssetName).content as XML);
                this.window = (this._widget.windowManager.buildFromXML(_local_3, 1) as IWindowContainer);
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
            if (((k.getParser().botId == this._botId) && (k.getParser().commandId == this.skillType)))
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
