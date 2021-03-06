from cartridge.shop.forms import OrderForm
from shop.models import ShopOrder


class OrderForm(OrderForm):
    def __init__(self, request, step, data=None, initial=None, errors=None):
        super(OrderForm, self).__init__(request, step, data, initial, errors)
        self.discount_total = None
        self.shipping_total = None
        self.tax_total = None

    class Meta:
        model = ShopOrder
        fields = [
            'billing_detail_first_name',
            'billing_detail_last_name',
            'billing_detail_email',
            'discount_code',
            'billing_detail_message',
            'tax_total']
