<?php

namespace Database\Factories;

use App\Models\Countrie;
use Illuminate\Database\Eloquent\Factories\Factory;

class CountrieFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Countrie::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'title'=>'Sudan','title_ar'=>'السودان'
        ];
    }
}
