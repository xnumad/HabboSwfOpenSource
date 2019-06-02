package com.sulake.habbo.friendbar.view.tabs
{
    import com.sulake.habbo.friendbar.data.IHabboFriendBarData;
    import com.sulake.habbo.friendlist.IHabboFriendsList;
    import com.sulake.habbo.game.IHabboGameManager;
    import com.sulake.habbo.friendbar.view.IHabboFriendBarView;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.tracking.IHabboTracking;
    import com.sulake.habbo.friendbar.view.utils.TextCropper;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.events.WindowMouseEvent;
    import flash.geom.Point;

    public class Tab implements ITab 
    {
        public static var WIDTH:int = 127;
        public static var HEIGHT:int = 36;
        public static var _Str_2925:IHabboFriendBarData;
        public static var FRIENDS:IHabboFriendsList;
        public static var GAMES:IHabboGameManager;
        public static var _Str_3553:IHabboFriendBarView;
        public static var _Str_2787:IAssetLibrary;
        public static var _Str_3684:IHabboWindowManager;
        public static var _Str_3840:IHabboLocalizationManager;
        public static var _Str_4533:IHabboTracking;
        public static var _Str_9890:TextCropper;
        protected static const _Str_11139:Boolean = false;
        protected static const _Str_6722:int = 80;
        protected static const _Str_6252:int = 3;

        protected var _window:IWindowContainer;
        protected var _Str_2638:Boolean;
        private var _Str_18162:Boolean;
        private var _selected:Boolean;
        private var _disposed:Boolean;


        public function get window():IWindowContainer
        {
            return this._window;
        }

        public function get selected():Boolean
        {
            return this._selected;
        }

        public function get _Str_6044():Boolean
        {
            return this._Str_2638;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        protected function get _Str_3341():Boolean
        {
            return this._Str_18162;
        }

        public function select(k:Boolean):void
        {
            this.conceal();
            this._selected = true;
        }

        public function deselect(k:Boolean):void
        {
            this._selected = false;
        }

        public function recycle():void
        {
            this.conceal();
            this._Str_2638 = true;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                if (this._window)
                {
                    this._window.dispose();
                    this._window = null;
                }
                this._disposed = true;
            }
        }

        protected function expose():void
        {
            this._Str_18162 = true;
        }

        protected function conceal():void
        {
            this._Str_18162 = false;
        }

        protected function onMouseClick(k:WindowMouseEvent):void
        {
            if (((this.disposed) || (this._Str_6044)))
            {
                return;
            }
            if (this.selected)
            {
                _Str_3553.deSelect(true);
            }
            else
            {
                _Str_3553._Str_8513(this, true);
            }
        }

        protected function onMouseOver(k:WindowMouseEvent):void
        {
            if (((this.disposed) || (this._Str_6044)))
            {
                return;
            }
            if (!this.selected)
            {
                this.expose();
            }
        }

        protected function onMouseOut(k:WindowMouseEvent):void
        {
            if ((((this.disposed) || (this._Str_6044)) || (this._window == null)))
            {
                return;
            }
            if (!this.selected)
            {
                if (!this._window.hitTestGlobalPoint(new Point(k.stageX, k.stageY)))
                {
                    this.conceal();
                }
            }
        }
    }
}
