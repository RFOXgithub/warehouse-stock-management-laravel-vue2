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
import { Ref, ref } from 'vue';

const defaultPlaceholder = today(getLocalTimeZone());
const date = ref() as Ref<DateValue>;
const df = new DateFormatter('en-US', {
    dateStyle: 'long',
});

const breadcrumbs: BreadcrumbItem[] = [
    {
        title: 'Create a Product',
        href: '/products/create',
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
    kode_barang: '',
    tanggal: '',
    jumlah_masuk: '',
    keterangan: '',
});

const handleSubmitLog = () => {
    console.log(form);
};

const handleSubmit = () => {
    form.post('/products');
};
</script>

<template>
    <Head title="Create a Barang Masuk" />

    <AppLayout :breadcrumbs="breadcrumbs">
        <div class="p-4">
            <form @submit.prevent="handleSubmitLog" class="w-8/12 space-y-4">
                <div class="space-y-2">
                    <Label for="kodebarang">Kode Barang</Label>
                    <Select v-model="form.kode_barang">
                        <SelectTrigger class="w-8/8">
                            <SelectValue placeholder="Kode Barang" />
                        </SelectTrigger>
                        <SelectContent>
                            <SelectGroup>
                                <SelectLabel>Kode Barang</SelectLabel>
                                <SelectItem
                                    v-for="item in props.product"
                                    :key="item.item_id"
                                    :value="item.kode_barang"
                                >
                                    {{ item.kode_barang }} -
                                    {{ item.nama_barang }}
                                </SelectItem>
                            </SelectGroup>
                        </SelectContent>
                    </Select>
                </div>
                <div class="space-y-2">
                    <Label for="tanggal">Tanggal</Label>
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
                                        : 'Tanggal'
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
                    <Label for="jumlahmasuk">Jumlah Masuk</Label>
                    <Input
                        v-model="form.jumlah_masuk"
                        type="number"
                        min="0"
                        placeholder="Jumlah Masuk"
                    />
                    <div
                        class="text-sm text-red-600"
                        v-if="form.errors.jumlah_masuk"
                    >
                        {{ form.errors.jumlah_masuk }}
                    </div>
                </div>
                <div class="space-y-4">
                    <Label for="keterangan">Keterangan</Label>
                    <Input
                        v-model="form.keterangan"
                        type="text"
                        placeholder="Keterangan"
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
                    >Create a Incoming Product</Button
                >
            </form>
        </div>
    </AppLayout>
</template>
