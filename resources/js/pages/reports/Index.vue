<script setup lang="ts">
import { Alert, AlertDescription, AlertTitle } from '@/components/ui/alert';
import Button from '@/components/ui/button/Button.vue';
import Calendar from '@/components/ui/calendar/Calendar.vue';
import {
    Popover,
    PopoverContent,
    PopoverTrigger,
} from '@/components/ui/popover/';
import {
    Table,
    TableBody,
    TableCaption,
    TableCell,
    TableHead,
    TableHeader,
    TableRow,
} from '@/components/ui/table/';
import AppLayout from '@/layouts/AppLayout.vue';
import { cn } from '@/lib/utils';
import { type BreadcrumbItem } from '@/types';
import { Head, router, useForm, usePage } from '@inertiajs/vue3';
import type { DateValue } from '@internationalized/date';
import {
    DateFormatter,
    getLocalTimeZone,
    today,
} from '@internationalized/date';
import { CalendarIcon, Check } from 'lucide-vue-next';
import { Ref, ref, watch } from 'vue';

const defaultPlaceholder = today(getLocalTimeZone());
const startdate = ref() as Ref<DateValue>;
const enddate = ref() as Ref<DateValue>;
const df = new DateFormatter('en-US', {
    dateStyle: 'long',
});

interface Product {
    item_id: number;
    kode_barang: string;
    nama_barang: string;
    satuan: string;
    stock_awal: number;
    barang_masuks_sum_jumlah_masuk: number;
    barang_keluars_sum_jumlah_keluar: number;
    stock_akhir: number;
    start_date: string;
    end_date: string;
}

interface Props {
    reports: Product[];
    startdate: string;
    enddate: string;
}

const handleDelete = (item_id: number) => {
    if (confirm('Do you want to delete the product?')) {
        router.delete(`/products/${item_id}`);
    }
};

const handleSubmitLog = () => {
    console.log(form);
};

const props = defineProps<Props>();
const page = usePage();

const form = useForm({
    startdate: props.startdate,
    enddate: props.enddate,
});

watch([startdate, enddate], ([newStart, newEnd]) => {
    ((form.startdate = newStart ? newStart.toString() : ''),
        (form.enddate = newEnd ? newEnd.toString() : ''));
});

const handleSubmit = () => {
    if (!form.startdate) {
        form.setError('startdate', 'Start date is required');
    }
    if (!form.enddate) {
        form.setError('enddate', 'End date is required');
    }

    if (!form.startdate || !form.enddate) return;

    form.get('/reports/filter');
};

const breadcrumbs: BreadcrumbItem[] = [
    {
        title: 'Products',
        href: '/products',
    },
];
</script>

<template>
    <Head title="Products" />

    <AppLayout :breadcrumbs="breadcrumbs">
        <div class="p-4">
            <div v-if="$page.props.flash?.message" class="alert">
                <Alert class="mb-6 bg-green-900">
                    <Check />
                    <AlertTitle>Notification!</AlertTitle>
                    <AlertDescription>
                        {{ $page.props.flash.message }}
                    </AlertDescription>
                </Alert>
            </div>
            <form @submit.prevent="handleSubmit" class="w-auto space-y-4">
                <div class="flex items-center space-x-4">
                    <div>
                        <Popover v-slot="{ close }">
                            <PopoverTrigger as-child>
                                <Button
                                    variant="outline"
                                    :class="
                                        cn(
                                            'w-[200px] justify-start text-left font-normal',
                                            !startdate &&
                                                'text-muted-foreground',
                                        )
                                    "
                                >
                                    <CalendarIcon />
                                    {{
                                        startdate
                                            ? df.format(
                                                  startdate.toDate(
                                                      getLocalTimeZone(),
                                                  ),
                                              )
                                            : (props.startdate ?? 'Start Date')
                                    }}
                                </Button>
                            </PopoverTrigger>
                            <PopoverContent class="w-auto p-0" align="start">
                                <Calendar
                                    v-model="startdate"
                                    :default-placeholder="defaultPlaceholder"
                                    layout="month-and-year"
                                    initial-focus
                                    @update:model-value="close"
                                />
                            </PopoverContent>
                        </Popover>
                        <div
                            class="mb-[-20px] text-sm text-red-600"
                            v-if="form.errors.startdate"
                        >
                            {{ form.errors.startdate }}
                        </div>
                    </div>
                    <div>
                        <Popover v-slot="{ close }">
                            <PopoverTrigger as-child>
                                <Button
                                    variant="outline"
                                    :class="
                                        cn(
                                            'w-[200px] justify-start text-left font-normal',
                                            !enddate && 'text-muted-foreground',
                                        )
                                    "
                                >
                                    <CalendarIcon />
                                    {{
                                        enddate
                                            ? df.format(
                                                  enddate.toDate(
                                                      getLocalTimeZone(),
                                                  ),
                                              )
                                            : (props.enddate ?? 'End Date')
                                    }}
                                </Button>
                            </PopoverTrigger>
                            <PopoverContent class="w-auto p-0" align="start">
                                <Calendar
                                    v-model="enddate"
                                    :default-placeholder="defaultPlaceholder"
                                    layout="month-and-year"
                                    initial-focus
                                    @update:model-value="close"
                                />
                            </PopoverContent>
                        </Popover>
                        <div
                            class="mb-[-20px] text-sm text-red-600"
                            v-if="form.errors.enddate"
                        >
                            {{ form.errors.enddate }}
                        </div>
                    </div>
                    <div>
                        <Button
                            class="w-[100px]"
                            type="submit"
                            :disabled="form.processing"
                            >Filter</Button
                        >
                    </div>
                </div>
            </form>
        </div>

        <Table>
            <TableCaption>A list of products.</TableCaption>
            <TableHeader>
                <TableRow>
                    <TableHead> Product</TableHead>
                    <TableHead>Unit</TableHead>
                    <TableHead> Opening Stock </TableHead>
                    <TableHead> Incoming Stock</TableHead>
                    <TableHead> Outgoing Stock</TableHead>
                    <TableHead> Ending Stock</TableHead>
                </TableRow>
            </TableHeader>
            <TableBody>
                <TableRow
                    v-for="product in props.reports"
                    :key="product.item_id"
                >
                    <TableCell class="font-medium">
                        {{ product.kode_barang }} -
                        {{ product.nama_barang }}
                    </TableCell>
                    <TableCell>{{ product.satuan }}</TableCell>
                    <TableCell>{{ product.stock_awal }}</TableCell>
                    <TableCell>
                        {{ product.barang_masuks_sum_jumlah_masuk ?? 0 }}
                    </TableCell>
                    <TableCell>
                        {{ product.barang_keluars_sum_jumlah_keluar ?? 0 }}
                    </TableCell>
                    <TableCell>
                        {{ product.stock_akhir ?? 0 }}
                    </TableCell>
                </TableRow>
            </TableBody>
        </Table>
    </AppLayout>
</template>
