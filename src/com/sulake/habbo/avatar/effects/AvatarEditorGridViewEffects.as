package com.sulake.habbo.avatar.effects
{
    import com.sulake.habbo.avatar.common.IAvatarEditorGridView;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.avatar.common.IAvatarEditorCategoryModel;
    import com.sulake.core.window.components.IItemGridWindow;
    import __AS3__.vec.Vector;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.avatar.IHabboAvatarEditorAvatarEffect;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import __AS3__.vec.*;
    import com.sulake.habbo.avatar.common.*;

    public class AvatarEditorGridViewEffects implements IAvatarEditorGridView 
    {
        private var _view:IWindowContainer;
        private var _firstView:Boolean = true;
        private var _model:IAvatarEditorCategoryModel;
        private var _categoryId:String;
        private var _partGrid:IItemGridWindow;
        private var _effectItems:Vector.<AvatarEditorGridItemEffect>;
        private var _notification:IWindow;
        private var _title:IWindow;

        public function AvatarEditorGridViewEffects(k:IWindowContainer)
        {
            this._view = k;
            this._partGrid = (this._view.findChildByName("thumbs") as IItemGridWindow);
            this._notification = this._view.findChildByName("content_notification");
            this._title = this._view.findChildByName("content_title");
        }

        public function dispose():void
        {
            if (this._partGrid)
            {
                this._partGrid.dispose();
                this._partGrid = null;
            }
            this._model = null;
            if (this._view)
            {
                this._view.dispose();
                this._view = null;
            }
        }

        public function get window():IWindowContainer
        {
            return this._view;
        }

        public function initFromList(k:IAvatarEditorCategoryModel, _arg_2:String):void
        {
            var _local_4:AvatarEditorGridItemEffect;
            var _local_5:IHabboAvatarEditorAvatarEffect;
            this._model = k;
            this._categoryId = _arg_2;
            this._view.visible = true;
            var _local_3:Array = EffectsModel(this._model).effects;
            this._partGrid._Str_3956();
            this._effectItems = new Vector.<AvatarEditorGridItemEffect>();
            if (_local_3.length == 0)
            {
                this._title.visible = true;
                this._notification.visible = true;
            }
            else
            {
                this._notification.visible = false;
                this._title.visible = false;
                _local_4 = new AvatarEditorGridItemEffect(null, this._model.controller.manager.windowManager, this._model.controller.manager.assets);
                this._Str_2816(_local_4);
                for each (_local_5 in _local_3)
                {
                    _local_4 = new AvatarEditorGridItemEffect(_local_5, this._model.controller.manager.windowManager, this._model.controller.manager.assets);
                    this._Str_2816(_local_4);
                }
            }
            this._Str_5614(0);
            this._firstView = false;
        }

        private function _Str_2816(k:AvatarEditorGridItemEffect):void
        {
            k.window.procedure = this._Str_23531;
            this._effectItems.push(k);
            this._partGrid._Str_2816(k.window);
        }

        public function _Str_5614(k:int):void
        {
            var _local_2:IWindow = this._view.findChildByName("palette0");
            var _local_3:IWindow = this._view.findChildByName("palette1");
            _local_2.visible = false;
            _local_3.visible = false;
        }

        public function get _Str_26200():Boolean
        {
            return this._firstView;
        }

        public function _Str_24690(k:int, _arg_2:Boolean):void
        {
            if (((k >= 0) && (k < this._effectItems.length)))
            {
                this._effectItems[k].selected = _arg_2;
            }
        }

        public function _Str_17454(k:int):int
        {
            var _local_2:int;
            while (_local_2 < this._effectItems.length)
            {
                if (this._effectItems[_local_2].effectType == k)
                {
                    return _local_2;
                }
                _local_2++;
            }
            return -1;
        }

        private function _Str_23531(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:int;
            if (k.type == WindowMouseEvent.DOWN)
            {
                _local_3 = this._partGrid._Str_3373(k.window);
                this._model.selectPart(this._categoryId, _local_3);
            }
        }
    }
}
