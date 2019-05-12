package com.sulake.habbo.avatar.common
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;

    public class CategoryBaseView 
    {
        protected var window:IWindowContainer;
        protected var _Str_2889:String = "";
        protected var _Str_2851:String = "";
        protected var _Str_2307:IAvatarEditorCategoryModel;
        protected var _Str_2367:Boolean;

        public function CategoryBaseView(k:IAvatarEditorCategoryModel)
        {
            this._Str_2307 = k;
        }

        public function dispose():void
        {
            if (this.window)
            {
                this.window.dispose();
                this.window = null;
            }
            this._Str_2307 = null;
            this._Str_2367 = false;
        }

        public function init():void
        {
        }

        public function reset():void
        {
            this._Str_2889 = "";
            this._Str_2851 = "";
            this._Str_2367 = false;
        }

        public function getWindowContainer():IWindowContainer
        {
            if (!this._Str_2367)
            {
                this.init();
            }
            return this.window;
        }

        public function _Str_5614(k:String, _arg_2:int):void
        {
            this._Str_2307.controller.view._Str_19197._Str_5614(_arg_2);
        }

        protected function updateGridView(k:String):void
        {
            this._Str_2307.controller.view._Str_19197.initFromList(this._Str_2307, k);
        }

        protected function _Str_3621(k:String):void
        {
            var _local_3:IStaticBitmapWrapperWindow;
            if (!this.window)
            {
                return;
            }
            var _local_2:IWindowContainer = (this.window.findChildByName(k) as IWindowContainer);
            if (_local_2)
            {
                _local_3 = (_local_2.findChildByTag("BITMAP") as IStaticBitmapWrapperWindow);
                TabUtils._Str_2972(_local_3, true);
            }
        }

        protected function _Str_3905(k:String):void
        {
            var _local_3:IStaticBitmapWrapperWindow;
            if (!this.window)
            {
                return;
            }
            var _local_2:IWindowContainer = (this.window.findChildByName(k) as IWindowContainer);
            if (_local_2)
            {
                _local_3 = (_local_2.findChildByTag("BITMAP") as IStaticBitmapWrapperWindow);
                TabUtils._Str_2972(_local_3, false);
            }
        }
    }
}

