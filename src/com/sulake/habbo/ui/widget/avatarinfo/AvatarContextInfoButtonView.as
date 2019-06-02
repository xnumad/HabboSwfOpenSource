package com.sulake.habbo.ui.widget.avatarinfo
{
    import com.sulake.habbo.ui.widget.contextmenu.ButtonMenuView;
    import com.sulake.habbo.ui.widget.contextmenu.IContextMenuParentWidget;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.room.object.RoomObjectTypeEnum;
    import flash.geom.Rectangle;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.habbo.friendlist.RelationshipStatusEnum;

    public class AvatarContextInfoButtonView extends ButtonMenuView 
    {
        protected var _Str_2306:int;
        protected var _Str_2360:String;
        protected var _Str_3021:int;
        protected var _Str_3947:Boolean;
        protected var _Str_2775:int;

        public function AvatarContextInfoButtonView(k:IContextMenuParentWidget)
        {
            super(k);
        }

        public static function setup(k:AvatarContextInfoButtonView, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:int, _arg_6:Boolean=false, _arg_7:Boolean=false):void
        {
            k._Str_2306 = _arg_2;
            k._Str_2360 = _arg_3;
            k._Str_3021 = _arg_5;
            k._Str_2775 = _arg_4;
            k._Str_3947 = _arg_6;
            k._Str_3403 = _arg_7;
            _Str_8532(k);
        }


        public function get userId():int
        {
            return this._Str_2306;
        }

        public function get _Str_2908():int
        {
            return this._Str_3021;
        }

        public function get roomIndex():int
        {
            return this._Str_2775;
        }

        public function get userName():String
        {
            return this._Str_2360;
        }

        public function get _Str_4330():Boolean
        {
            return this._Str_3947;
        }

        override protected function updateWindow():void
        {
            var _local_2:XML;
            var _local_3:IWindow;
            if ((((!(_Str_2268)) || (!(_Str_2268.assets))) || (!(_Str_2268.windowManager))))
            {
                return;
            }
            if (!_window)
            {
                _local_2 = (_Str_2268.assets.getAssetByName("avatar_info_widget").content as XML);
                _window = (_Str_2268.windowManager.buildFromXML(_local_2, 0) as IWindowContainer);
                if (!_window)
                {
                    return;
                }
            }
            var k:IWindow = _window.findChildByName("name");
            k.caption = this._Str_2360;
            this._Str_11603();
            if (!this._Str_3947)
            {
                _window.findChildByName("change_name_container").visible = false;
                _window.height = 39;
            }
            else
            {
                _local_3 = _window.findChildByName("change_name_container");
                _local_3.visible = true;
                _window.height = (39 + _local_3.height);
                _Str_2786(_window.findChildByName("change_name_container"), _Str_4612);
            }
            activeView = _window;
			_window.color = RelationshipStatusEnum.relationshipColor(_Str_2268.friendList.getRelationshipStatus(this.userId));
			if (_Str_5032)
			{
				_Str_5032.color = RelationshipStatusEnum.relationshipColor(_Str_2268.friendList.getRelationshipStatus(this.userId));
			}
        }

        override protected function getOffset(k:Rectangle):int
        {
            var _local_2:int = -(_Str_3007.height);
            if ((((this._Str_3021 == RoomObjectTypeEnum.HABBO) || (this._Str_3021 == RoomObjectTypeEnum.BOT)) || (this._Str_3021 == RoomObjectTypeEnum.RENTABLE_BOT)))
            {
                _local_2 = (_local_2 + ((k.height > 50) ? 25 : 0));
            }
            else
            {
                _local_2 = (_local_2 - 4);
            }
            return _local_2;
        }

        protected function _Str_11603():void
        {
            var k:IStaticBitmapWrapperWindow;
            if (((_Str_2268) && (_Str_2268.friendList)))
            {
                k = IStaticBitmapWrapperWindow(_window.findChildByName("relationship_status"));
				var status:String = RelationshipStatusEnum._Str_7401(_Str_2268.friendList.getRelationshipStatus(this.userId));
                k.assetUri = ("relationship_status_" + status);
				_window.color = RelationshipStatusEnum.relationshipColor(_Str_2268.friendList.getRelationshipStatus(this.userId));
				if (_Str_5032)
				{
					_Str_5032.color = RelationshipStatusEnum.relationshipColor(_Str_2268.friendList.getRelationshipStatus(this.userId));
				}
				Habbo.trackLoginStep("_26: " + _window.color + "");
				Habbo.trackLoginStep("_26: " + k.parent.color + "");
				Habbo.trackLoginStep("_26: " + k.parent.parent.color + "");
				
                k.assetUri = ("relationship_status_" + status);
            }
        }
    }
}
