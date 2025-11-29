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
import { cn } from '@/lib/utils';
import { type BreadcrumbItem } from '@/types';
import { Head, useForm } from '@inertiajs/vue3';
import type { DateValue } from '@internationalized/date';
import {
    DateFormatter,
    getLocalTimeZone,
    today,
} from '@internationalized/date';
import { CalendarIcon } from 'lucide-vue-next';
import { Ref, ref, watch } from 'vue';

const defaultPlaceholder = today(getLocalTimeZone());
const date = ref() as Ref<DateValue>;
const df = new DateFormatter('en-US', {
    dateStyle: 'long',
});

const breadcrumbs: BreadcrumbItem[] = [
    {
        title: 'Create a Outgoing Product',
        href: '/barangkeluar/create',
    },
];

interface Product {
    item_id: number;
    kode_barang: string;
    nama_barang: string;
}

interface Props {
    product: Product[];
}

const props = defineProps<Props>();

const form = useForm({
    item_id: '',
    tanggal: '',
    jumlah_keluar: '',
    keterangan: '',
});

const handleSubmitLog = () => {
    console.log(form);
};

const handleSubmit = () => {
    form.post('/barangkeluar');
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
    <Head title="Create a Outgoing Product" />

    <AppLayout :breadcrumbs="breadcrumbs">
        <div class="p-4">
            <form @submit.prevent="handleSubmit" class="w-8/12 space-y-4">
                <div class="space-y-2">
                    <Label for="kodebarang">Product</Label>
                    <Select v-model="form.item_id">
                        <SelectTrigger class="w-8/8">
                            <SelectValue placeholder="Product" />
                        </SelectTrigger>
                        <SelectContent>
                            <SelectGroup>
                                <SelectLabel>Product</SelectLabel>
                                <SelectItem
                                    v-for="item in props.product"
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
                                :class="
                                    cn(
                                        'w-8/8 justify-start text-left font-normal',
                                        !date && 'text-muted-foreground',
                                    )
                                "
                            >
                                <CalendarIcon />
                                {{
                                    date
                                        ? df.format(
                                              date.toDate(getLocalTimeZone()),
                                          )
                                        : 'Date'
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
                    >Create a Outgoing Product</Button
                >
            </form>
        </div>
    </AppLayout>
</template>
