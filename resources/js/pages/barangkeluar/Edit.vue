<script setup lang="ts">
import Button from '@/components/ui/button/Button.vue';
import Calendar from '@/components/ui/calendar/Calendar.vue';
import Input from '@/components/ui/input/Input.vue';
import Label from '@/components/ui/label/Label.vue';
import {
    Popover,
    PopoverContent,
    PopoverTrigger,
} from '@/components/ui/popover/';
import {
    Select,
    SelectContent,
    SelectGroup,
    SelectItem,
    SelectLabel,
    SelectTrigger,
    SelectValue,
} from '@/components/ui/select';
import AppLayout from '@/layouts/AppLayout.vue';
import { type BreadcrumbItem } from '@/types';
import { Head, useForm } from '@inertiajs/vue3';
import type { DateValue } from '@internationalized/date';
import {
    DateFormatter,
    getLocalTimeZone,
    today,
} from '@internationalized/date';
import { CalendarIcon } from 'lucide-vue-next';
import { computed, Ref, ref, watch } from 'vue';

const defaultPlaceholder = today(getLocalTimeZone());
const date = ref() as Ref<DateValue>;
const df = new DateFormatter('en-US', {
    dateStyle: 'long',
});

const breadcrumbs: BreadcrumbItem[] = [
    {
        title: 'Edit a Outgoing Product',
        href: '/barangkeluar/edit',
    },
];

const props = defineProps<{
    product: {
        id: number;
        item_id: number;
        kode_barang: string;
        nama_barang: string;
        tanggal: string;
        jumlah_keluar: number;
        keterangan: string;
    };
    barangkeluarops: Array<{
        item_id: number;
        kode_barang: string;
        nama_barang: string;
    }>;
}>();

const form = useForm({
    item_id: props.product.item_id,
    tanggal: '',
    jumlah_keluar: props.product.jumlah_keluar,
    keterangan: props.product.keterangan,
});

const selectedProduct = computed(() => {
    return props.barangkeluarops.find((item) => item.item_id === form.item_id);
});

const handleSubmitLog = () => {
    console.log(form);
};

const handleSubmit = () => {
    form.put(`/barangkeluar/${props.product.id}`);
};

watch(date, (val) => {
    if (val) {
        form.tanggal = val.toString();
    } else {
        form.tanggal = '';
    }
});
</script>

<template>
    <Head title="Edit a Outgoing Product" />

    <AppLayout :breadcrumbs="breadcrumbs">
        <div class="p-4">
            <form @submit.prevent="handleSubmit" class="w-8/12 space-y-4">
                <div class="space-y-2">
                    <Label for="kodebarang">Product</Label>

                    <Select v-model="form.item_id">
                        <SelectTrigger class="w-8/8">
                            <SelectValue>
                                <template v-if="selectedProduct">
                                    {{ selectedProduct.item_id }} -
                                    {{ selectedProduct.kode_barang }} -
                                    {{ selectedProduct.nama_barang }}
                                </template>

                                <template v-else>
                                    {{ props.product.item_id }} -
                                    {{ props.product.kode_barang }} -
                                    {{ props.product.nama_barang }}</template
                                >
                            </SelectValue>
                        </SelectTrigger>

                        <SelectContent>
                            <SelectGroup>
                                <SelectLabel>Product</SelectLabel>

                                <SelectItem
                                    v-for="item in props.barangkeluarops"
                                    :key="item.item_id"
                                    :value="item.item_id"
                                >
                                    {{ item.item_id }} -
                                    {{ item.kode_barang }} -
                                    {{ item.nama_barang }}
                                </SelectItem>
                            </SelectGroup>
                        </SelectContent>
                    </Select>
                </div>

                <div class="space-y-2">
                    <Label for="tanggal">Date</Label>

                    <Popover v-slot="{ close }">
                        <PopoverTrigger as-child>
                            <Button
                                variant="outline"
                                class="w-full justify-start text-left font-normal"
                            >
                                <CalendarIcon class="mr-2" />

                                {{
                                    date
                                        ? df.format(
                                              date.toDate(getLocalTimeZone()),
                                          )
                                        : df.format(
                                              new Date(props.product.tanggal),
                                          )
                                }}
                            </Button>
                        </PopoverTrigger>

                        <PopoverContent class="w-auto p-0" align="start">
                            <Calendar
                                v-model="date"
                                :default-placeholder="defaultPlaceholder"
                                layout="month-and-year"
                                initial-focus
                                @update:model-value="close"
                            />
                        </PopoverContent>
                    </Popover>
                </div>
                <div class="space-y-2">
                    <Label for="jumlahkeluar">Outgoing Stock</Label>
                    <Input
                        v-model="form.jumlah_keluar"
                        type="number"
                        min="1"
                        placeholder="Outgoing Stock"
                    />
                    <div
                        class="text-sm text-red-600"
                        v-if="form.errors.jumlah_keluar"
                    >
                        {{ form.errors.jumlah_keluar }}
                    </div>
                </div>
                <div class="space-y-4">
                    <Label for="keterangan">Description</Label>
                    <Input
                        v-model="form.keterangan"
                        type="text"
                        placeholder="Description"
                    />
                    <div
                        class="text-sm text-red-600"
                        v-if="form.errors.keterangan"
                    >
                        {{ form.errors.keterangan }}
                    </div>
                </div>
                <Button
                    class="mt-8 ml-auto block"
                    type="submit"
                    :disabled="form.processing"
                    >Update a Outgoing Product</Button
                >
            </form>
        </div>
    </AppLayout>
</template>
