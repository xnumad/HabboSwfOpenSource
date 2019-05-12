package com.sulake.habbo.navigator.mainview
{
    import com.sulake.habbo.navigator.IViewCtrl;
    import com.sulake.habbo.navigator.HabboNavigator;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.navigator.TagRenderer;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_6625;
    import com.sulake.habbo.navigator.Util;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.*;
    import com.sulake.core.window.components.*;
    import com.sulake.core.window.events.*;
    import com.sulake.core.window.enum.*;
    import com.sulake.habbo.navigator.*;

    public class PopularTagsListCtrl implements IViewCtrl 
    {
        private var _navigator:HabboNavigator;
        private var _content:IWindowContainer;
        private var _list:IItemListWindow;
        private var _rowHeight:int;
        private var _tagRenderer:TagRenderer;

        public function PopularTagsListCtrl(k:HabboNavigator):void
        {
            this._navigator = k;
            this._tagRenderer = new TagRenderer(this._navigator);
        }

        public function dispose():void
        {
            if (this._tagRenderer)
            {
                this._tagRenderer.dispose();
                this._tagRenderer = null;
            }
        }

        public function set content(k:IWindowContainer):void
        {
            this._content = k;
            this._list = ((this._content) ? IItemListWindow(this._content.findChildByName("item_list")) : null);
        }

        public function get content():IWindowContainer
        {
            return this._content;
        }

        public function refresh():void
        {
            var _local_4:_Str_6625;
            this._tagRenderer._Str_8651 = true;
            var k:Array = this._navigator.data._Str_6697.tags;
            var _local_2:IWindowContainer = IWindowContainer(this._list.getListItemAt(0));
            if (_local_2 == null)
            {
                _local_2 = IWindowContainer(this._navigator.getXmlWindow("grs_popular_tag_row"));
                this._list.addListItem(_local_2);
            }
            Util._Str_2930(_local_2);
            var _local_3:int;
            while (_local_3 < this._navigator.data._Str_6697.tags.length)
            {
                _local_4 = this._navigator.data._Str_6697.tags[_local_3];
                this._tagRenderer._Str_22102(_local_2, _local_3, _local_4.tagName);
                _local_3++;
            }
            Util._Str_7173(_local_2, _local_2.width, 18, 3);
            _local_2.height = Util._Str_2647(_local_2);
            this._content.findChildByName("no_tags_found").visible = (k.length < 1);
        }

        private function _Str_26120(k:IWindowContainer, _arg_2:_Str_6625):void
        {
            var _local_3:String = "txt";
            var _local_4:ITextWindow = ITextWindow(k.findChildByName(_local_3));
            if (_arg_2 == null)
            {
                return;
            }
            _local_4.visible = true;
            _local_4.text = _arg_2.tagName;
        }
    }
}

