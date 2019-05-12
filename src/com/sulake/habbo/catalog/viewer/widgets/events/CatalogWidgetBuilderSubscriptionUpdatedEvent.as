package com.sulake.habbo.catalog.viewer.widgets.events
{
    import flash.events.Event;

    public class CatalogWidgetBuilderSubscriptionUpdatedEvent extends Event 
    {
        public function CatalogWidgetBuilderSubscriptionUpdatedEvent(k:Boolean=false, _arg_2:Boolean=false)
        {
            super(CatalogWidgetEvent.BUILDER_SUBSCRIPTION_UPDATED, k, _arg_2);
        }
    }
}
