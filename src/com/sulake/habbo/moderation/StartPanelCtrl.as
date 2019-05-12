package com.sulake.habbo.moderation
{
    import com.sulake.core.runtime.IDisposable;
	import com.sulake.core.assets.BitmapDataAsset;
	import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.ILabelWindow;
    import com.sulake.habbo.communication.messages.parser.room.engine._Str_4522;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.communication.messages.outgoing.moderator._Str_7731;
	import com.sulake.core.window.components.IBitmapWrapperWindow;
	import flash.display.BitmapData;
	import com.sulake.habbo.avatar.enum.AvatarScaleType;
	import com.sulake.habbo.avatar.IAvatarImage;
	import com.sulake.habbo.avatar.enum.AvatarSetType;

    public class StartPanelCtrl implements IDisposable 
    {
        private var _main:ModerationManager;
        private var _frame:IFrameWindow;
        private var _userId:int;
        private var _isGuestRoom:Boolean;
        private var _roomId:int;
        private var _disposed:Boolean = false;

        public function StartPanelCtrl(k:ModerationManager)
        {
            this._main = k;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                this._main = null;
                if (this._frame)
                {
                    this._frame.dispose();
                    this._frame = null;
                }
            }
        }

        public function _Str_9380(k:int, _arg_2:String, figure:String=null, gender:String=null):void
        {
            if (this._frame == null)
            {
                return;
            }
            this._userId = k;
            this._frame.findChildByName("userinfo_but").enable();
            (IWindowContainer(this._frame.findChildByName("userinfo_but")).findChildByName("offence_name") as ILabelWindow).textColor = 0;
            IWindowContainer(this._frame.findChildByName("userinfo_but")).findChildByName("offence_name").caption = ("User info: " + _arg_2);
			
			if (figure != null && gender != null)
			{
				var _local_3:IAvatarImage = this._main.avatarRenderManager.createAvatarImage(figure, AvatarScaleType.LARGE, gender, null);
				if (!_local_3)
				{
					return;
				};
				_local_3.setDirection(AvatarSetType.HEAD, 2);
				var _local_4:BitmapData = _local_3._Str_818(AvatarSetType.HEAD, 0.5);
			
				if (_local_4 != null)
				{
					IBitmapWrapperWindow(IWindowContainer(this._frame.findChildByName("userinfo_but")).findChildByName("head")).bitmap = _local_4;
				}
			}
        }
		
		public function setVisible(visible:Boolean):void
		{
			if (this._frame == null)
			{
				return;
			}
			
			this._frame.visible = visible;
			
			if (this._main != null)
			{
				this._main.moderationIcon.show(!this._frame.visible);
			}
		}

        public function _Str_25175(k:_Str_4522):void
        {
            if (((this._frame == null) || (k == null)))
            {
                return;
            }
            this._frame.findChildByName("room_tool_but").enable();
            (IWindowContainer(this._frame.findChildByName("room_tool_but")).findChildByName("offence_name") as ILabelWindow).textColor = 0;
            this._Str_22550();
            this._isGuestRoom = true;
            this._roomId = k._Str_6550;
        }

        public function _Str_25510():void
        {
            if (this._frame == null)
            {
                return;
            }
            this._frame.findChildByName("room_tool_but").disable();
            this._frame.findChildByName("chatlog_but").disable();
        }

        public function show():void
        {
            if (this._frame == null)
            {
                this._frame = IFrameWindow(this._main.getXmlWindow("start_panel"));
                this._frame.findChildByName("room_tool_but").addEventListener(WindowMouseEvent.CLICK, this._Str_22877);
                this._frame.findChildByName("chatlog_but").addEventListener(WindowMouseEvent.CLICK, this._Str_16926);
                this._frame.findChildByName("ticket_queue_but").addEventListener(WindowMouseEvent.CLICK, this._Str_22945);
                this._frame.findChildByName("userinfo_but").addEventListener(WindowMouseEvent.CLICK, this._Str_22876);
                this._frame.findChildByName("room_tool_but").addEventListener(WindowMouseEvent.OVER, this.onMouseOver);
                this._frame.findChildByName("chatlog_but").addEventListener(WindowMouseEvent.OVER, this.onMouseOver);
                this._frame.findChildByName("ticket_queue_but").addEventListener(WindowMouseEvent.OVER, this.onMouseOver);
                this._frame.findChildByName("userinfo_but").addEventListener(WindowMouseEvent.OVER, this.onMouseOver);
                this._frame.findChildByName("room_tool_but").addEventListener(WindowMouseEvent.OUT, this.onMouseOut);
                this._frame.findChildByName("chatlog_but").addEventListener(WindowMouseEvent.OUT, this.onMouseOut);
                this._frame.findChildByName("ticket_queue_but").addEventListener(WindowMouseEvent.OUT, this.onMouseOut);
                this._frame.findChildByName("userinfo_but").addEventListener(WindowMouseEvent.OUT, this.onMouseOut);
                this._frame.findChildByName("userinfo_but").disable();
                this._frame.findChildByName("room_tool_but").disable();
                this._frame.findChildByName("chatlog_but").disable();
                if (!this._main._Str_3325._Str_24070)
                {
                    this._frame.findChildByName("ticket_queue_but").disable();
                }
                if (!this._main._Str_3325._Str_12765)
                {
                    this._frame.findChildByName("chatlog_but").disable();
                }
                (IWindowContainer(this._frame.findChildByName("userinfo_but")).findChildByName("offence_name") as ILabelWindow).textColor = 0x666666;
                (IWindowContainer(this._frame.findChildByName("room_tool_but")).findChildByName("offence_name") as ILabelWindow).textColor = 0x666666;
                (IWindowContainer(this._frame.findChildByName("chatlog_but")).findChildByName("offence_name") as ILabelWindow).textColor = 0x666666;
				this._frame.procedure = this.procedureHandler;
            }
            this.setVisible(true);
        }

        private function _Str_22550():void
        {
            if (this._main._Str_3325._Str_12765)
            {
                this._frame.findChildByName("chatlog_but").enable();
                (IWindowContainer(this._frame.findChildByName("chatlog_but")).findChildByName("offence_name") as ILabelWindow).textColor = 0;
            }
        }

        private function onMouseOver(k:WindowEvent):void
        {
            if (!k.window._Str_5065())
            {
                return;
            }
            (k.window as IWindowContainer).findChildByName("mouseover").visible = true;
        }

        private function onMouseOut(k:WindowEvent):void
        {
            (k.window as IWindowContainer).findChildByName("mouseover").visible = false;
        }

        private function _Str_22877(k:WindowEvent):void
        {
            this._main.windowTracker.show(new RoomToolCtrl(this._main, this._roomId), this._frame, false, false, true);
        }

        private function _Str_16926(k:WindowEvent):void
        {
            this._main.windowTracker.show(new ChatlogCtrl(new _Str_7731(((this._isGuestRoom) ? 0 : 1), this._roomId), this._main, WindowTracker._Str_10414, this._roomId), this._frame, false, false, true);
        }

        private function _Str_22876(k:WindowEvent):void
        {
            this._main.windowTracker.show(new UserInfoFrameCtrl(this._main, this._userId), this._frame, false, false, true);
        }

        private function _Str_22945(k:WindowEvent):void
        {
            this._main.issueManager.init();
        }
		
		private function procedureHandler(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                switch (_arg_2.name)
                {
                    case "header_button_close":
                        this.setVisible(false)
                        return;
				}
			}
		}
    }
}
