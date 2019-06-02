package com.sulake.habbo.friendbar.landingview.widget
{
    import com.sulake.habbo.friendbar.landingview.interfaces.ILandingViewWidget;
    import com.sulake.habbo.friendbar.landingview.interfaces.ISettingsAwareWidget;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.friendbar.landingview.layout._Str_3695;
    import com.sulake.habbo.friendbar.landingview.layout._Str_3198;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;

    public class RoomHopperNetworkWidget implements ILandingViewWidget, ISettingsAwareWidget 
    {
        private var _landingView:HabboLandingView;
        private var _container:IWindowContainer;
        private var _disposed:Boolean = false;
        private var _targetNetworkId:int;
        private var _textElements:Array;

        public function RoomHopperNetworkWidget(k:HabboLandingView)
        {
            this._textElements = new Array();
            super();
            this._landingView = k;
            this._textElements.push("title");
            this._textElements.push("header");
            this._textElements.push("info");
        }

        protected static function get xmlAssetName():String
        {
            return "room_hopper_network";
        }


        public function initialize():void
        {
            this._container = IWindowContainer(this._landingView.getXmlWindow(xmlAssetName));
            this._targetNetworkId = this._landingView.getInteger("landing.view.roomhopper.network.id", 0);
            var k:IStaticBitmapWrapperWindow = IStaticBitmapWrapperWindow(this._container.findChildByName("bitmap"));
            k.assetUri = this._landingView.getProperty("landing.view.roomhopper.image.uri");
            this._container.findChildByName("button").procedure = this._Str_22535;
        }

        public function refresh():void
        {
        }

        public function get container():IWindow
        {
            return this._container;
        }

        public function dispose():void
        {
            if (!this.disposed)
            {
                if (this._container)
                {
                    this._container.dispose();
                    this._container = null;
                }
                this._disposed = true;
            }
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function set settings(k:_Str_3198):void
        {
            _Str_3695._Str_5630(this._container, k);
        }

        private function _Str_22535(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._landingView.navigator.goToRoomNetwork(this._targetNetworkId, false);
            }
        }
    }
}
