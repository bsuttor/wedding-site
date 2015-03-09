from cartridge.shop.models import Order
from django.db import models
from django.utils.translation import ugettext_lazy as _


class ShopOrder(Order):
    billing_detail_message = models.TextField(_("Votre message"), blank=True)
    discount_total = None
    shipping_total = None
    tax_total = None
